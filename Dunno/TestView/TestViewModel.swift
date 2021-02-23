//
//  TestViewModel.swift
//  Dunno
//
//  Created by Misha Kuznecov on 13/01/2021.
//

import Foundation


class TestViewModel {
    private var exam: Exam
    private var fetcher = NetworkDataFetcher()
    private let userData: UserData = .shared
    private var selectedIndexPath: IndexPath?
    
    var currentQuestionPosition: Int
    
    var testTitle: String {
        exam.title
    }
    
    var questions: [Question] {
        exam.questions
    }
    
    var currentQuestion: Question {
        questions[currentQuestionPosition]
    }
    
    var isAnswerChecked: Bool {
        questions[currentQuestionPosition].answers.first { $0.checked } != nil
    }
    
    var isLastQuestion: Bool {
        currentQuestionPosition == questions.count - 1
    }
    
    init(exam: Exam) {
        self.exam = exam
        self.currentQuestionPosition = 0
    }
    
    func addNextQuestionPosition() {
        if !isLastQuestion {
            currentQuestionPosition += 1
        }
    }
    
    func sendAnswersToServer() {
        fetcher.sendAnswers(toExamWithID: String(exam.id), questions: exam.questions)
    }
}

extension TestViewModel: TableViewModelType {
    var numberOfRows: Int { currentQuestion.answers.count }
    var numberOfSections: Int { 0 }
    
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CellViewModelType? {
        AnswerCellViewModel(answer: currentQuestion.answers[indexPath.row])
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        nil
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        selectedIndexPath = indexPath
    }
    
    func toggleAnswer(atIndexPath indexPath: IndexPath) {
        currentQuestion.answers.forEach { $0.checked = false }
        currentQuestion.answers[indexPath.row].checked = true
    }
}
