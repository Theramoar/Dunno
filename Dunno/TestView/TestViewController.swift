//
//  TestViewController.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import UIKit

class TestViewController: UIViewController {
    var test: FetchedTest?
    var fetcher = NetworkDataFetcher()
    let userData: UserData = .shared
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var collectionViewView: UICollectionView!
    
    override func viewDidLoad() {
        collectionViewView.delegate = self
        collectionViewView.dataSource = self
        collectionViewView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellWithReuseIdentifier: "QuestionCell")
        
        submitButton.layer.cornerRadius = 10
        fetcher.fetchTest { test in
            self.test = test
            self.collectionViewView.reloadData()
        }
    }
    
    @IBAction func failTest(_ sender: Any) {
//        if let test = test {
//            userData.userStudent.failedTests.append(test)
//        }
        dismiss(animated: true)
    }
}


extension TestViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        test?.test.questions.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        cell.question = test?.test.questions[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var numberOfAnswers = test!.test.questions[indexPath.row].answers.count
        numberOfAnswers = numberOfAnswers % 2 == 0 ? numberOfAnswers : numberOfAnswers + 1
        let height = CGFloat(numberOfAnswers / 2 * 50 + 100)
        return CGSize(width: UIScreen.main.bounds.width - 30, height: height)
    }
    
}
