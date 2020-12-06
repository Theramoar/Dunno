//
//  AnswerCell.swift
//  Dunno
//
//  Created by Misha Kuznecov on 05/12/2020.
//

import UIKit

class AnswerCell: UICollectionViewCell {
    @IBOutlet weak var answerLabel: UILabel!
    var isAnswerSelected: Bool = false {
        didSet {
            print(isAnswerSelected)
            contentView.backgroundColor = isSelected ? .orange : appColor
        }
    }
    
    override func awakeFromNib() {
        layer.cornerRadius = frame.size.height / 14
    }
}
