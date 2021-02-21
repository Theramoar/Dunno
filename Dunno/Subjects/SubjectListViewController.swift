//
//  ViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 30/11/2020.
//

import UIKit

class SubjectListViewController: UIViewController {
    private let viewModel = ClassViewModel()
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var layerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        setupNavigation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setTableCorners()
    }
    
    private func setTableCorners() {
        let size = CGSize(width: 30, height: 30)
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = UIBezierPath(roundedRect: layerView.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: size).cgPath

        layerView.layer.mask = shapeLayer
    }
    
    private func setupTable() {
        tableView.register(UINib(nibName: "SubjectCell", bundle: nil), forCellReuseIdentifier: "SubjectCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    private func setupNavigation() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTest))
    }
    
    
    @objc private func addTest() {
        let vc = EnterCodeViewController()
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }
}


extension SubjectListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! SubjectCell
        cell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath) as? SubjectCellViewModel
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectRow(atIndexPath: indexPath)
        if viewModel.userIsAlreadyRegisteredForTest() {
            viewModel.fetchSelectedExam { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let fetchedExam):
                    let exam = Exam(fetchedExam)
                    let vc = TestViewController()
                    vc.viewModel = self.viewModel.viewModelForTestView(exam: exam)
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
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
                        title = "Server error"
                        message = "Please, try again later"
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
        } else {
            let vc = TestPrepViewController()
            vc.viewModel = viewModel.viewModelForTestPrepView()
            present(vc, animated: true)
        }
    }
}
