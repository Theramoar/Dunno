//
//  AnswerCollectionView.swift
//  Dunno
//
//  Created by Misha Kuznecov on 05/12/2020.
//

import UIKit

//class AnswerCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
////    var answers = [FetchedAnswer]()
//    
//    init() {
//        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
//        self.register(UINib(nibName: "AnswerCell", bundle: nil), forCellWithReuseIdentifier: "AnswerCell")
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        self.register(UINib(nibName: "AnswerCell", bundle: nil), forCellWithReuseIdentifier: "AnswerCell")
//        dataSource = self
//        delegate = self
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        answers.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerCell", for: indexPath) as! AnswerCell
//        cell.answerLabel.text = answers[indexPath.row].title
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 150, height: 50)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("didSelectItemAt")
//        let selectedCell = collectionView.cellForItem(at: indexPath) as! AnswerCell
//        let cells = collectionView.visibleCells as! [AnswerCell]
//        cells.forEach { $0.isAnswerSelected = false }
//        selectedCell.isAnswerSelected = true
//    }
//}
