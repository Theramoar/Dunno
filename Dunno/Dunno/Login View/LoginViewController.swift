//
//  LoginViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 05/12/2020.
//

import UIKit


class LoginViewController: UIViewController {
    
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    
    @IBOutlet private var signinButton: UIButton!
    @IBOutlet private var registerButton: UIButton!
    
    override func viewDidLoad() {
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Enter e-mail",
                                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Enter password",
                                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        setupAppearance(for: signinButton)
        setupAppearance(for: registerButton)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func viewTapped() {
        view.endEditing(true)
    }
    
    @IBAction func signinPressed(_ sender: Any) {
        
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        let vc = RegisterViewController()
        present(vc, animated: true)
    }
    
    
    private func setupAppearance(for button: UIButton) {
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 4
    }
    
}
