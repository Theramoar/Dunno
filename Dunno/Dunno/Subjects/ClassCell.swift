//
//  ClassCell.swift
//  Dunno
//
//  Created by Misha Kuznecov on 30/11/2020.
//

import UIKit

class ClassCell: UITableViewCell {
    weak var viewModel: ClassCellViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            textLabel?.text = viewModel.className
        }
    }
    
    override func awakeFromNib() {
        selectionStyle = .none
    }
}

class ClassCellViewModel: CellViewModelType {
    private let studyClass: Subject
    
    var className: String {
        studyClass.name
    }
    
    init(studyClass: Subject) {
        self.studyClass = studyClass
    }
}
