//
//  SubjectCell.swift
//  Dunno
//
//  Created by Misha Kuznecov on 03/12/2020.
//

import UIKit

class TopicCell: UITableViewCell {
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var topicView: UIView!
    
    override func awakeFromNib() {
        selectionStyle = .none
        topicView.layer.cornerRadius = 10
    }
}

class TopicCellViewModel: CellViewModelType {
}

