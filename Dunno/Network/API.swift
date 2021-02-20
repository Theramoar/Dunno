//
//  API.swift
//  Dunno
//
//  Created by Misha Kuznecov on 05/12/2020.
//

import Foundation

enum API: String {
    case scheme = "https"
    case host = "dunno.social"
    
    enum Endpoints: String {
        case login = "/api/login"
    }
}
