//
//  EnterCodeVC.swift
//  Dunno
//
//  Created by Misha Kuznecov on 25/01/2021.
//

import UIKit

class EnterCodeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private var enterCodeTextField: UITextField!
    @IBOutlet private var startTestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppNavigationBar(title: "Add new test")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
        
        enterCodeTextField.delegate = self
        startTestButton.isEnabled = false
        startTestButton.backgroundColor = Colors.disabledButtonColor!
    }
    
    @objc private func viewTapped() {
        view.endEditing(true)
    }
    
    private func setupTextField() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: enterCodeTextField.frame.height - 1, width: enterCodeTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        enterCodeTextField.borderStyle = UITextField.BorderStyle.none
        enterCodeTextField.layer.addSublayer(bottomLine)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupTextField()
        startTestButton.layer.cornerRadius = 20
    }
    
    @IBAction private func startTestButtonPressed(_ sender: Any) {
        let vc = TestPrepViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Method, that react on textField change and dissmises the button
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let text = textField.text,
                  let range = Range(range, in: text) else {
                startTestButton.isEnabled = false
                startTestButton.backgroundColor = Colors.disabledButtonColor!
                return true
            }
            textField.text?.replaceSubrange(range, with: string)
            
            if let text = textField.text, !text.isEmpty {
                startTestButton.isEnabled = true
                startTestButton.backgroundColor = Colors.appColor!
                //change color here
            } else {
                startTestButton.isEnabled = false
                startTestButton.backgroundColor = Colors.disabledButtonColor!
            }

            return false
        }
}
