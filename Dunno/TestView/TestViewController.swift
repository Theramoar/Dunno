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
//        collectionViewView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellWithReuseIdentifier: "QuestionCell")
    }
    
    @IBAction func failTest(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension TestViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}


//extension TestViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        viewModel.numberOfRows
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
//        cell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath) as? QuestionCellViewModel
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        var numberOfAnswers = viewModel.numberOfAnswersForQuestion(at: indexPath)
//        numberOfAnswers = numberOfAnswers % 2 == 0 ? numberOfAnswers : numberOfAnswers + 1
//        let height = CGFloat(numberOfAnswers / 2 * 50 + 100)
//        return CGSize(width: UIScreen.main.bounds.width - 30, height: height)
//    }
//
//}
