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
    var viewModel: TestPrepViewModel!
    private var notificationCenter: NotificationCenter = .default
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
        guard let name = enterNameTextField.text, !name.isEmpty else {
            presentErrorAlert(title: "Name is empty!", message: "Please enter your name.")
            return
        }
        viewModel.registerForTest(withName: name) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(_):

                self.notificationCenter.post(name: .userWasRegisteredForTest, object: nil)
                self.dismiss(animated: true)
            case .failure(let error):
                var title = ""
                var message = ""
                switch error {
                case .badURL:
                    title = "Internal error occured"
                    message = "Please contact the support team"
                case .noResponse:
                    title = "Network error"
                    message = "Please, try again later"
                case .validationErrorCode:
                    title = "Entered name is incorrect"
                    message = "Please, enter antoher name"
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

class TestPrepViewModel {
    var test: Test
    let network = NetworkDataFetcher()
    let coreData: CoreDataManager = .shared
    let userData: UserData = .shared
    
    init(test: Test) {
        self.test = test
    }
    
    func registerForTest(withName name: String, completion: @escaping (Result<String, NetworkError>) -> Void) {

        guard let code = test.code else { return }
        network.registerForTest(withCode: code, name: name) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let testInfo):
                let testId = testInfo.0
                let accessToken = testInfo.1
                self.updateTestWith(id: testId)
                self.save(authToken: accessToken)
                completion(.success(""))
                break
            case .failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
    
    func updateTestWith(id: Int) {
        coreData.updateTestWith(id: id, test: test)
    }
    
    func save(authToken: String) {
        userData.authToken = authToken
    }
    
//    func viewModelForTestView() -> TestViewModel {
//        TestViewModel(exam: <#T##FetchedExam#>)
//    }
}
