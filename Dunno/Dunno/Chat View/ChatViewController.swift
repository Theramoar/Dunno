//
//  ChatViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 30/11/2020.
//

import UIKit

class ChatViewController: UIViewController {
    private var textFieldViewInitialHeight: CGFloat!
    private var notificationCenter: NotificationCenter = .default

    @IBOutlet private var sendButton: UIButton!
    @IBOutlet private var smsTextField: UITextField!
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var textFieldViewHeight: NSLayoutConstraint!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTable()
        setupNotifications()
    }
    
    // MARK: - ViewController setup Methods
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "MessageCell")
        tableView.separatorStyle = .none
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        tapGesture.cancelsTouchesInView = false
        tableView.addGestureRecognizer(tapGesture)
    }

    private func setupUI() {
//        navigationItem.title = viewModel.destinationPhoneNumber
        sendButton.layer.cornerRadius = 10
        textFieldViewInitialHeight = textFieldViewHeight.constant
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(barButtonTapped))
        activityIndicator.isHidden = true
    }

    private func setupNotifications() {
        notificationCenter.addObserver(self, selector: #selector(keyboardWillChangeFrame), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillChangeFrame), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        guard viewModel.numberOfRows > 0 else { return }
//        let indexPath = IndexPath(row: viewModel.numberOfRows - 1, section: 0)
//        tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
//    }
    
    @objc private func viewTapped() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillChangeFrame(notification: NSNotification) {
        let bottomMargins = view.layoutMargins.bottom
        guard let userInfo = notification.userInfo,
              let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else { return }
        let textFieldKeyboardHeight = keyboardSize.height + textFieldViewInitialHeight - bottomMargins
        textFieldViewHeight.constant = notification.name == UIResponder.keyboardWillHideNotification ? textFieldViewInitialHeight : textFieldKeyboardHeight
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        UserData.shared.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        cell.viewModel = MessageCellViewModel(message: UserData.shared.messages[indexPath.row])
        return cell
    }
}


