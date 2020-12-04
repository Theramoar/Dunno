//
//  UserData.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import Foundation

class UserData {
    static let shared = UserData()
    private init() {
        userStudent = Student(name: "Misha Kuznetsov")
    }
    
    var userStudent: Student
    var messages = [SavedMessage]()
}
