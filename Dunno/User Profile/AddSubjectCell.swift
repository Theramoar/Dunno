//
//  AddSubjectCell.swift
//  Dunno
//
//  Created by Misha Kuznecov on 03/12/2020.
//

import UIKit

protocol AddButtonDelegate {
    func openSubjectList()
}

class AddSubjectCell: UITableViewCell {
    @IBOutlet private var addButton: UIButton!
    var delegate: AddButtonDelegate?
    
    override func awakeFromNib() {
        selectionStyle = .none
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        delegate?.openSubjectList()
    }
    
}

class AddSubjectCellViewModel: CellViewModelType {
    
}
