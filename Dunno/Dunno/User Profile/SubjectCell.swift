//
//  SubjectCell.swift
//  Dunno
//
//  Created by Misha Kuznecov on 03/12/2020.
//

import UIKit

class SubjectCell: UITableViewCell {
    @IBOutlet weak var subjectLabel: UILabel!
    
    override func awakeFromNib() {
        selectionStyle = .none
    }
}

class SubjectCellViewModel: CellViewModelType {
}

