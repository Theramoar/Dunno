//
//  QuestionCell.swift
//  Dunno
//
//  Created by Misha Kuznecov on 05/12/2020.
//

import UIKit


class QuestionCell: UICollectionViewCell {
    
    @IBOutlet private var questionLabel: UILabel!
    @IBOutlet private var answerCollectionView: AnswerCollectionView!
    
    var viewModel: QuestionCellViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            questionLabel.text = viewModel.questionTitle
            #warning("Use here viewModel Instead of question.answers")
            answerCollectionView.answers = viewModel.question.answers
            answerCollectionView.reloadData()
        }
    }
}

class QuestionCellViewModel: CellViewModelType {
    var question: FetchedQuestion
    
    var questionTitle: String {
        question.title
    }
    
    init(question: FetchedQuestion) {
        self.question = question
    }
}
