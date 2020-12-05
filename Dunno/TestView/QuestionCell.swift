//
//  QuestionCell.swift
//  Dunno
//
//  Created by Misha Kuznecov on 05/12/2020.
//

import UIKit


class QuestionCell: UICollectionViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    var question: FetchedQuestion! {
        didSet {
            questionLabel.text = question.title
            answerCollectionView.answers = question.answers
            answerCollectionView.reloadData()
        }
    }
    @IBOutlet weak var answerCollectionView: AnswerCollectionView!
}
