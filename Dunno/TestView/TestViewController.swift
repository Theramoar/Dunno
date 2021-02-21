//
//  TestViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import UIKit

class TestViewController: UIViewController {
    var viewModel: TestViewModel!

    @IBOutlet private var submitButton: UIButton!
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var layerView: UIView!
    @IBOutlet private var testNameLabel: UILabel!
    @IBOutlet private var timeLeftLabel: UILabel!
    @IBOutlet private var questionNumberLabel: UILabel!
    @IBOutlet private var questionLabel: UILabel!
    
    
    override func viewDidLoad() {
        navigationController?.navigationBar.backgroundColor = Colors.appColor
        navigationController?.navigationBar.tintColor = .white
        
        setupCollectionView()
        
        submitButton.layer.cornerRadius = 10
        
        testNameLabel.text = viewModel.testTitle
        setupQuestion()
        setupButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setViewCorners()
    }
    
    private func setViewCorners() {
        let size = CGSize(width: 30, height: 30)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: layerView.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: size).cgPath
        layerView.layer.mask = shapeLayer
    }
    
    private func setupCollectionView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "AnswerCell", bundle: nil), forCellReuseIdentifier: "AnswerCell")
    }
    
    private func setupQuestion() {
        questionNumberLabel.text = "Question #\(viewModel.currentQuestionPosition + 1)"
        questionLabel.text = viewModel.currentQuestion.title
    }
    
    private func setupButton() {
        let title = viewModel.isLastQuestion ? "FINISH" : "NEXT QUESTION"
        submitButton.setTitle(title, for: .normal)
    }
    
    @IBAction func failTest(_ sender: Any) {
        if viewModel.isLastQuestion {
            dismiss(animated: true)
        } else {
            showNextQuestion()
        }
    }
    
    func showNextQuestion() {
        viewModel.addNextQuestionPosition()
        setupQuestion()
        setupButton()
        tableView.reloadData()
    }
}

extension TestViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath) as! AnswerCell
        cell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath) as? AnswerCellViewModel
        cell.highlightCell(ifNecessary: viewModel.isAnswerChecked)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.toggleAnswer(atIndexPath: indexPath)
        tableView.reloadData()
    }
}
