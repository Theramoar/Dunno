//
//  RegisterViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 05/12/2020.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Enter e-mail",
                                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Enter name",
                                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Enter password",
                                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        setupAppearance(for: registerButton)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func registerPressed(_ sender: Any) {

    }
    
    @objc private func viewTapped() {
        view.endEditing(true)
    }
    
    private func setupAppearance(for button: UIButton) {
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 4
    }
}
