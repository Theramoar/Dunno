//
//  ClassViewModel.swift
//  Dunno
//
//  Created by Misha Kuznecov on 30/11/2020.
//

import Foundation

class ClassViewModel: TableViewModelType {
    private let userData: UserData = .shared
    private let coreData: CoreDataManager = .shared
    private var selectedIndexPath: IndexPath?
    
    init() {
        userData.tests = coreData.loadDataFromContainer(ofType: Test.self)
    }
    

    
    var numberOfSections: Int {
        0
    }
    
    var numberOfRows: Int {
        userData.tests.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CellViewModelType? {
        let test = userData.tests[indexPath.row]
        return SubjectCellViewModel(test: test)
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        nil
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        selectedIndexPath = indexPath
    }
    
    func userIsAlreadyRegisteredForTest() -> Bool {
        guard let indexPath = selectedIndexPath else { fatalError("No selected indexPath") }
        return userData.tests[indexPath.row].id != nil
    }
    
    func viewModelForTestPrepView() -> TestPrepViewModel {
        guard let indexPath = selectedIndexPath else { fatalError("No selected indexPath") }
        let test = userData.tests[indexPath.row]
        return TestPrepViewModel(test: test)
    }
    
    func viewModelForTestView() -> TestViewModel {
        guard let indexPath = selectedIndexPath else { fatalError("No selected indexPath") }
        let test = userData.tests[indexPath.row]
        return TestViewModel(test: test)
    }
}
