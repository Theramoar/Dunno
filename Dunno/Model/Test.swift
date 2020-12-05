//
//  Test.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import Foundation

class Test {
    var topic: Topic
    var questions = [Question]()
    
    init(topic: Topic) {
        self.topic = topic
    }
}

class Question {
    var question = "Question"
    var answer = "Answer"
}
