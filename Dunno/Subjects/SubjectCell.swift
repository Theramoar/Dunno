//
//  ClassCell.swift
//  Dunno
//
//  Created by Misha Kuznecov on 30/11/2020.
//

import UIKit

class SubjectCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subjectView: UIView!
    weak var viewModel: SubjectCellViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            nameLabel.text = viewModel.className
        }
    }
    
    override func awakeFromNib() {
        selectionStyle = .none
        subjectView.layer.cornerRadius = 10
    }
}

class SubjectCellViewModel: CellViewModelType {
    private let studyClass: Subject
    
    var className: String {
        studyClass.name
    }
    
    init(studyClass: Subject) {
        self.studyClass = studyClass
    }
}
