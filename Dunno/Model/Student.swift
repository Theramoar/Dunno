//
//  Student.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import Foundation

class Student {
    var name = ""
    var mentors = [Mentor]()
    var studyingTopics = [Topic]()
    var failedTests = [FetchedTest]()

    init(name: String, mentors: [Mentor] = [], studyingTopics: [Topic] = []) {
        self.name = name
        self.mentors = mentors
        self.studyingTopics = studyingTopics
    }
}

class Mentor {
    var student: Student
    var topic: Topic
    
    init(topic: Topic, student: Student) {
        self.topic = topic
        self.student = student
    }
}



