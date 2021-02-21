//
//  AnswerCell.swift
//  Dunno
//
//  Created by Misha Kuznecov on 21/02/2021.
//

import UIKit

class AnswerCell: UITableViewCell {
    
    @IBOutlet private var visibleView: UIView!
    @IBOutlet private var checkmarkImageView: UIImageView!
    @IBOutlet private var answerLabel: UILabel!
    
    var viewModel: AnswerCellViewModel! {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            answerLabel.text = viewModel.title
        }
    }
    
    func highlightCell(ifNecessary: Bool) {
        guard ifNecessary else {
            setHighlightedView(chosedAnswer: false)
            return
        }
        
        if viewModel.checked {
            setHighlightedView(chosedAnswer: true)
        } else {
            setUnhighlightedView()
        }
    }
    
    private func setHighlightedView(chosedAnswer: Bool) {
        checkmarkImageView.image = chosedAnswer ? UIImage(systemName: "record.circle")?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal) : UIImage(systemName: "circle")?.withTintColor(UIColor.lightGray, renderingMode: .alwaysOriginal)
        answerLabel.textColor = .label
        visibleView.layer.opacity = 1
    }
    
    private func setUnhighlightedView() {
        checkmarkImageView.image = UIImage(systemName: "circle")?.withTintColor(UIColor.lightGray, renderingMode: .alwaysOriginal)
        answerLabel.textColor = .lightGray
        visibleView.layer.opacity = 0.4
    }
    
    override func awakeFromNib() {
        selectionStyle = .none
        visibleView.layer.cornerRadius = 10
        checkmarkImageView.image = UIImage(systemName: "circle")?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal)
    }
}

class AnswerCellViewModel: CellViewModelType {
    private let answer: Answer
    
    var title: String {
        answer.title
    }
    
    var checked: Bool {
        answer.checked
    }
    
    init(answer: Answer) {
        self.answer = answer
    }
}
