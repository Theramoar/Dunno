//
//  Student.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import Foundation

class Student {
    var name = ""
    var mentoringTopics = [Topic]()
    var studyingTopics = [Topic]()
    var failedTests = [Test]()

    init(name: String, mentoringTopics: [Topic] = [], studyingTopics: [Topic] = []) {
        self.name = name
        self.mentoringTopics = mentoringTopics
        self.studyingTopics = studyingTopics
    }
}
