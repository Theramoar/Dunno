//
//  TestViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import UIKit

class TestViewController: UIViewController {
    var viewModel: TestViewModel!

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var collectionViewView: UICollectionView!
    
    override func viewDidLoad() {
        setupCollectionView()
        
        submitButton.layer.cornerRadius = 10
        viewModel.fetchTests { [weak self] in
            self?.collectionViewView.reloadData()
        }
    }
    
    private func setupCollectionView() {
        collectionViewView.delegate = self
        collectionViewView.dataSource = self
        collectionViewView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellWithReuseIdentifier: "QuestionCell")
    }
    
    @IBAction func failTest(_ sender: Any) {
        dismiss(animated: true)
    }
}


extension TestViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        cell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath) as? QuestionCellViewModel
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var numberOfAnswers = viewModel.numberOfAnswersForQuestion(at: indexPath)
        numberOfAnswers = numberOfAnswers % 2 == 0 ? numberOfAnswers : numberOfAnswers + 1
        let height = CGFloat(numberOfAnswers / 2 * 50 + 100)
        return CGSize(width: UIScreen.main.bounds.width - 30, height: height)
    }
    
}
