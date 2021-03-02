//
//  Test.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import Foundation



class Exam {
    let id: Int
    let title: String
    
    var questions: [Question]
    
    init(_ fetchedExam: FetchedExam) {
        self.title = fetchedExam.test.title
        self.id = fetchedExam.id
        self.questions = []
        guard let fetchedQuestions = fetchedExam.test.questions else { return }
        for fetchedQuestion in fetchedQuestions {
            let question = Question(fetchedQuestion)
            questions.append(question)
        }
        
    }
}

class Question {
    let title: String
    var answers: [Answer]
    
    init(_ fetchedQuestion: FetchdQuestion) {
        self.title = fetchedQuestion.title
        self.answers = []
        for fetchedAnswer in fetchedQuestion.answers {
            let answer = Answer(fetchedAnswer)
            answers.append(answer)
        }
    }
}

class Answer {
    enum AnswerType {
        case singleChoice, multipleChoice, text
    }
    
    let title: String
    let correct: Bool
    var checked: Bool
    let type: AnswerType
    
    init(_ fetchedAnswer: FetchedAnswer) {
        self.title = fetchedAnswer.title
        self.checked = false
        self.correct = fetchedAnswer.correct
        
        switch fetchedAnswer.type {
        case 0:
            self.type = .singleChoice
        case 1:
            self.type = .multipleChoice
        case 2:
            self.type = .text
        default:
            self.type = .singleChoice
        }
    }
}

