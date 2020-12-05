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
        addButton.layer.cornerRadius = addButton.frame.width / 2
        let image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15, weight: .regular, scale: .large))?.withTintColor(.white, renderingMode: .alwaysOriginal)
        addButton.setImage(image, for: .normal)
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        delegate?.openSubjectList()
    }
    
}

class AddSubjectCellViewModel: CellViewModelType {
    
}
