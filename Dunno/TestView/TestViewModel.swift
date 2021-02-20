//
//  TestViewModel.swift
//  Dunno
//
//  Created by Misha Kuznecov on 13/01/2021.
//

import Foundation


class TestViewModel {
    private var test: Test
    private var fetcher = NetworkDataFetcher()
    private let userData: UserData = .shared
    
    var testTitle: String {
        test.title ?? "N/A"
    }
    
    init(test: Test) {
        self.test = test
    }
    
}

//extension TestViewModel: TableViewModelType {
//    var numberOfRows: Int { test?.test.questions.count ?? 0 }
//    var numberOfSections: Int { 0 }
//    
//    
//    func cellViewModel(forIndexPath indexPath: IndexPath) -> CellViewModelType? {
//        guard let question  = test?.test.questions[indexPath.row] else { return nil }
//        return QuestionCellViewModel(question: question)
//    }
//    
//    func viewModelForSelectedRow() -> DetailViewModelType? {
//        nil
//    }
//    
//    func selectRow(atIndexPath indexPath: IndexPath) { }
//}
