//
//  FetchedTest.swift
//  Dunno
//
//  Created by Misha Kuznecov on 05/12/2020.
//

import Foundation

struct FetchedTest: Decodable {
    let id: Int
    let test: TestForm
}

struct TestForm: Decodable {
    let id: Int
    let title: String
    let status: String
    let questions: [FetchedQuestion]
}

struct FetchedQuestion: Decodable {
    let id: Int
    let title: String
    let answers: [FetchedAnswer]
}

struct FetchedAnswer: Decodable {
    let id: Int
    let title: String
    let correct: Bool
}
