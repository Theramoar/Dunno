//
//  API.swift
//  Dunno
//
//  Created by Misha Kuznecov on 05/12/2020.
//

import Foundation

enum API: String {
    case scheme = "https"
    case host = "d179d82f036c.ngrok.io"
    
    enum Endpoints: String {
        case endpoint = "/api/exam/1/conduct"
        case login = "/api/login"
    }
}
