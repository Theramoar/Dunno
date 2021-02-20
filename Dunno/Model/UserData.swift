//
//  UserData.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import Foundation

class UserData {
    static let shared = UserData()
    private let userDefaults: UserDefaults = .standard

    var authToken: String {
        didSet {
            userDefaults.set(authToken, forKey: "UserSigned")
        }
    }
    
    var tests: [Test]
    
    private init() {
        authToken = userDefaults.string(forKey: "UserSigned") ?? ""
        tests = []
    }
}
