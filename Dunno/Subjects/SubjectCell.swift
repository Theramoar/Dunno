//
//  ClassCell.swift
//  Dunno
//
//  Created by Misha Kuznecov on 30/11/2020.
//

import UIKit

class SubjectCell: UITableViewCell {
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var subjectView: UIView!
    @IBOutlet private var timerImageView: UIImageView!
    weak var viewModel: SubjectCellViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            nameLabel.text = viewModel.className
        }
    }
    
    override func awakeFromNib() {
        selectionStyle = .none
        subjectView.layer.cornerRadius = 10
        timerImageView.image = UIImage(systemName: "clock")?.withTintColor(UIColor(named: "AppColor")!, renderingMode: .alwaysOriginal)
    }
}

class SubjectCellViewModel: CellViewModelType {
    private let test: Test
    
    var className: String {
        test.title ?? "N/A"
    }
    
    init(test: Test) {
        self.test = test
    }
}
