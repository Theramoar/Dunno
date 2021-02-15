//
//  TestPrepVC.swift
//  Dunno
//
//  Created by MihailsKuznecovs on 26/01/2021.
//

import UIKit

struct Colors {
    static let appColor = UIColor(named: "AppColor")
    static let disabledButtonColor = UIColor(named: "ButtonDisabledColor")
}

class TestPrepViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private var enterNameTextField: UITextField!
    @IBOutlet private var startTestButton: UIButton!
    @IBOutlet private var countdownLabel: UILabel!
    
    override func viewDidLoad() {
        countdownLabel.isHidden = true
        setAppNavigationBar(title: "Prepare for the test!")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
        
        enterNameTextField.delegate = self
        startTestButton.isEnabled = false
        startTestButton.backgroundColor = Colors.disabledButtonColor!
    }
    
    @objc private func viewTapped() {
        view.endEditing(true)
    }
    
    @IBAction private func startTestButtonPressed(_ sender: Any) {
        let vc = TestViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupTextField() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: enterNameTextField.frame.height - 1, width: enterNameTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        enterNameTextField.borderStyle = UITextField.BorderStyle.none
        enterNameTextField.layer.addSublayer(bottomLine)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupTextField()
        startTestButton.layer.cornerRadius = 20
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
                //change color here
            }

            return false
        }
}
