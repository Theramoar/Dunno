//
//  Dummies.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import Foundation

let dummyMentors = [Mentor(topic: dummyTopics[0], student: dummyStudents[0]),
                    Mentor(topic: dummyTopics[1], student: dummyStudents[1]),
                    Mentor(topic: dummyTopics[1], student: dummyStudents[2])]

let dummyStudents = [Student(name: "Ivan"),
                    Student(name: "Misha"),
                    Student(name: "Slavik")]

let dummyTests = [Test(topic: dummyTopics[0]),
                Test(topic: dummyTopics[1]),
                Test(topic: dummyTopics[2])]

let dummySubjects = [Subject(name: "Math", topics: [dummyTopics[0]]),
                    Subject(name: "Science"),
                    Subject(name: "English", topics: [dummyTopics[1]]),
                    Subject(name: "History", topics: [dummyTopics[2]])]
let dummyTopics = [
    Topic(name: "Logariphms"),
    Topic(name: "Past Simple"),
    Topic(name: "Russia History")
]
