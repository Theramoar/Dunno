//
//  Dummies.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import Foundation

let dummyMentors = [
    Mentor(topic: dummyMathTopics[0], student: dummyStudents[0]),
    Mentor(topic: dummyMathTopics[0], student: dummyStudents[1]),
    Mentor(topic: dummyMathTopics[0], student: dummyStudents[2]),
    Mentor(topic: dummyMathTopics[0], student: dummyStudents[3]),
    Mentor(topic: dummyTopics[0], student: dummyStudents[0]),
    Mentor(topic: dummyTopics[1], student: dummyStudents[1]),
    Mentor(topic: dummyTopics[1], student: dummyStudents[2])
]

let dummyStudents = [Student(name: "Dmitriy"),
                    Student(name: "Misha"),
                    Student(name: "Slavik"),
                    Student(name: "Nikolay")
]

let dummyTests = [Test(topic: dummyTopics[0]),
                Test(topic: dummyTopics[1]),
                Test(topic: dummyTopics[2])]

let dummySubjects = [Subject(name: "Math 👨‍🏫", topics: dummyMathTopics),
                    Subject(name: "Science 👨‍🔬"),
                    Subject(name: "English 💂‍♀️", topics: [dummyTopics[0]]),
                    Subject(name: "History 👑", topics: [dummyTopics[1]])]
let dummyTopics = [
    Topic(name: "Past Simple"),
    Topic(name: "Russia History")
]

let dummyMathTopics = [
    Topic(name: "Logarithms"),
    Topic(name: "Geometry"),
    Topic(name: "Integers"),
    Topic(name: "Fractions")
]
