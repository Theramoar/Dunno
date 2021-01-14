//
//  ClassViewModel.swift
//  Dunno
//
//  Created by Misha Kuznecov on 30/11/2020.
//

import Foundation

class ClassViewModel: TableViewModelType {
    var numberOfSections: Int {
        0
    }
    
    var numberOfRows: Int {
        dummySubjects.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CellViewModelType? {
        SubjectCellViewModel(studyClass: dummySubjects[indexPath.row])
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        nil
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {}
}
