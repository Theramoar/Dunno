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

enum NetworkError: String, Error {
    case badURL = "There was proble creating URL"
    case noResponse = "No response from the server"
    case validationErrorCode = "Entered code is incorrect "
    case serverErrorCode = "There was problem connecting to the server"
    case noData = "There is no Data Received"
    case failDecoding = "Fail Decoding JSON"
}


class NetworkDataFetcher {
    private let network = NetworkService()
    
    func fetchTest(code: String, completion: @escaping (Result<FetchedTest, NetworkError>) -> Void) {
        let path = API.Endpoints.login.rawValue + "/" + code
        network.makeRequest(type: .get, path: path, params: nil, authHeader: nil) { response in
            switch response {
            case .success(let data):
                guard let test = self.decodeJSON(type: FetchedTest.self, from: data) else {
                    print("Fail Decoding JSON")
                    completion(.failure(.failDecoding))
                    return
                }
                completion(.success(test))
            case .failure(let networkError):
                completion(.failure(networkError))
            }
        }
    }
    
    func registerForTest(withCode code: String, name: String, completion: @escaping (Result<(Int, String), NetworkError>) -> Void) {
        let path = API.Endpoints.login.rawValue + "/" + code
        let params = ["name": name]
        network.makeRequest(type: .post, path: path, params: params, authHeader: nil) { response in
            switch response {
            case .success(let data):
                
                if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let testId = json["test_id"] as? Int,
                   let accessToken = json["access_token"] as? String {
                    completion(.success((testId, accessToken)))
                }
                #warning("Обработать отсутсвие json")
                break
            case .failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
    
    func login(with email: String,password: String, completion: @escaping (String?) -> Void) {
        let params = [
            "email": email,
            "password": password
        ]
        network.makeRequest(type: .post, path: API.Endpoints.login.rawValue, params: params, authHeader: nil) { (data) in
//            guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: String] else {
//                print("Error Receiving Token")
//                return
//            }
//            if let _ = json["message"] {
//                completion(nil)
//            }
//            else if let message = json["apiToken"] {
//                completion(message)
//            }
//            print(json)
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
