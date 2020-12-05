//
//  ClassViewModel.swift
//  Dunno
//
//  Created by Misha Kuznecov on 30/11/2020.
//

import Foundation

protocol TableViewViewModelType {
    var numberOfRows: Int { get }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CellViewModelType?
    func viewModelForSelectedRow() -> DetailViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
}

protocol DetailViewModelType {}
protocol CellViewModelType {}

class ClassViewModel: TableViewViewModelType {
    var numberOfRows: Int {
        dummySubjects.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CellViewModelType? {
        ClassCellViewModel(studyClass: dummySubjects[indexPath.row])
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        nil
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {}
}
