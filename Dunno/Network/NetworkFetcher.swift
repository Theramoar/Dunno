//
//  NetworkService.swift
//  Dunno
//
//  Created by Misha Kuznecov on 05/12/2020.
//

import Foundation

struct LoginResponse: Decodable {
    let apiToken: String
}


class NetworkDataFetcher {
    private let network = NetworkService()
    
    func fetchTest(completion: @escaping (FetchedTest) -> Void) {
        let authHeader = UserData.shared.authToken
        print(authHeader)
        network.makeRequest(type: .get, path: API.Endpoints.endpoint.rawValue, params: nil, authHeader: authHeader) { data in
            guard let test = self.decodeJSON(type: FetchedTest.self, from: data) else {
                print("Fail Decoding JSON")
                return
            }
            print(test)
            completion(test)
        }
    }
    
    func login(with email: String,password: String, completion: @escaping (String?) -> Void) {
        let params = [
            "email": email,
            "password": password
        ]
        network.makeRequest(type: .post, path: API.Endpoints.login.rawValue, params: params, authHeader: nil) { (data) in
            guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: String] else {
                print("Error Receiving Token")
                return
            }
            if let _ = json["message"] {
                completion(nil)
            }
            else if let message = json["apiToken"] {
                completion(message)
            }
            print(json)
        }
    }
    
    
    //MARK: - Private Methods
    private func decodeJSON<T: Decodable>(type: T.Type, from data: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = data, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
}
