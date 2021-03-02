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
    private let viewModel = EnterCodeViewModel()
    private var notificationCenter: NotificationCenter = .default
    
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
        guard let code = enterCodeTextField.text, !code.isEmpty else {
            presentErrorAlert(title: "Test code is empty!", message: "Please enter test code.")
            return
        }
        
        guard !viewModel.testWithCodeAlreadyExists(code) else {
            presentErrorAlert(title: "Test already exists", message: "You can find it in Active tests screen")
            return
        }
        
        viewModel.fetchTest(code: code) { [weak self] result in
            guard let self = self else { return }
            switch result {
            
            case .success(_):
                self.notificationCenter.post(name: .testMopdelWasUpdated, object: nil)
                let vc = TestPrepViewController()
                vc.viewModel = self.viewModel.viewModelForTestPrep()
                self.navigationController?.pushViewController(vc, animated: true)
            case .failure(let networkError):
                var title = ""
                var message = ""
                switch networkError {
                case .badURL:
                    title = "Internal error occured"
                    message = "Please contact the support team"
                case .noResponse:
                    title = "Network error"
                    message = "Please, try again later"
                case .validationErrorCode:
                    title = "Entered code is incorrect"
                    message = "Please, enter antoher code"
                case .serverErrorCode:
                    title = "Server error"
                    message = "Please, try again later"
                case .noData:
                    title = "The test was deleted"
                    message = "Please, enter another code"
                case .failDecoding:
                    title = "Internal error occured"
                    message = "Please contact the support team"
                }
                self.presentErrorAlert(title: title, message: message)
            }
        }
        
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


extension UIViewController {
    func presentErrorAlert(title: String?, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alert.view.tintColor = Colors.appColor!
        alert.addAction(ok)
        present(alert, animated: true)
    }
}


class EnterCodeViewModel {
    let network = NetworkDataFetcher()
    let coreData: CoreDataManager = .shared
    let userData: UserData = .shared
    private var newTest: Test?
    
    func testWithCodeAlreadyExists(_ code: String) -> Bool {
        userData.tests.first { $0.code == code } != nil
    }
    
    func fetchTest(code: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        network.fetchTest(code: code) { [weak self] result in
            switch result {
            case .success(let fetchedTest):
                self?.save(fetchedTest: fetchedTest, withCode: code)
                completion(.success(""))
            case .failure(let networkError):
                print(networkError.rawValue)
                completion(.failure(networkError))
            }
        }
    }
    
    private func save(fetchedTest: FetchedTest, withCode code: String) {
        #warning("remove newTest as it is appended in coreData.saveTest")
        let fromDate = dateFrom(string: fetchedTest.activeFrom ?? "")
        let toDate = dateFrom(string: fetchedTest.activeTo ?? "")
        
        newTest = coreData.saveTest(title: fetchedTest.title, code: code, fromDate: fromDate, toDate: toDate)
    }
    
    private func dateFrom(string: String) -> Date? {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from: string)
    }
    
    func viewModelForTestPrep() -> TestPrepViewModel {
        guard let test = newTest else { fatalError("Problem saving new test!") }
        return TestPrepViewModel(test: test)
    }
}
