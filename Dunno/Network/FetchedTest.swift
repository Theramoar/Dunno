//
//  FetchedTest.swift
//  Dunno
//
//  Created by Misha Kuznecov on 05/12/2020.
//

import Foundation

struct FetchedTest: Decodable {
    let title: String
    #warning("убрать ? когда всё будет ок")
    let activeFrom: String?
    let activeTo: String?
    let questions: [FetchdQuestion]?
}

struct FetchdQuestion: Decodable {
    let id: Int
    let title: String
    let answers: [FetchedAnswer]
}

struct FetchedAnswer: Decodable {
    let id: Int
    let title: String
    let type: Int
    let correct: Bool
}


struct FetchedExam: Decodable {
    let id: Int
    let test: FetchedTest
}
