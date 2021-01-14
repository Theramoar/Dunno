//
//  ViewModel Types.swift
//  Dunno
//
//  Created by Misha Kuznecov on 13/01/2021.
//

import Foundation

protocol TableViewModelType {
    var numberOfRows: Int { get }
    var numberOfSections: Int { get }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CellViewModelType?
    func viewModelForSelectedRow() -> DetailViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
}

protocol DetailViewModelType { }

protocol CellViewModelType { }
