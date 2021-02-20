//
//  LoginViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 05/12/2020.
//

import UIKit


class LoginViewController: UIViewController {
//    private var fetcher = NetworkDataFetcher()
//    @IBOutlet private var emailTextField: UITextField!
//    @IBOutlet private var passwordTextField: UITextField!
//    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
//    @IBOutlet private var signinButton: UIButton!
//    @IBOutlet private var registerButton: UIButton!
//    
//    override func viewDidLoad() {
//        activityIndicator.isHidden = true
//        emailTextField.attributedPlaceholder = NSAttributedString(string: "Enter e-mail",
//                                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
//        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Enter password",
//                                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
//        setupAppearance(for: signinButton)
//        setupAppearance(for: registerButton)
//        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
//        tapGesture.cancelsTouchesInView = false
//        self.view.addGestureRecognizer(tapGesture)
//    }
//    
//    @objc private func viewTapped() {
//        view.endEditing(true)
//    }
//    
//    @IBAction func signinPressed(_ sender: Any) {
//        activityIndicator.show(true)
//        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
//        fetcher.login(with: email, password: password) { [weak self] (token) in
//            self?.activityIndicator.show(false)
//            if let token = token {
//                UserData.shared.authToken = token
//                let vc = TabBarController()
//                vc.modalPresentationStyle = .fullScreen
//                self?.present(vc, animated: true)
//            } else {
//                let alert = UIAlertController(title: "Incorrect e-mail or password", message: nil, preferredStyle: .alert)
//                let action = UIAlertAction(title: "OK", style: .default)
//                alert.addAction(action)
//                self?.present(alert, animated: true)
//            }
//        }
//        
//        
//        
//    }
//    
//    @IBAction func registerPressed(_ sender: Any) {
//        let vc = RegisterViewController()
//        present(vc, animated: true)
//    }
//    
//    
//    private func setupAppearance(for button: UIButton) {
//        button.layer.cornerRadius = 10
//        button.layer.shadowOffset = CGSize(width: 0, height: 2)
//        button.layer.shadowOpacity = 0.3
//        button.layer.shadowRadius = 4
//    }
//    
}




