//
//  NetworkDataFetcher.swift
//  Dunno
//
//  Created by Misha Kuznecov on 05/12/2020.
//

import Foundation

enum RequestType: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

class NetworkService {
    func makeRequest(type: RequestType, path: String, params: [String : Any]?, authHeader: String?, completion: @escaping (Data) -> Void) {
        guard let url = creareUrl(from: path) else { print("ERROR, CREATING URL") ; return }
        let data = params != nil ? prepareJSONData(params: params!) : nil
        let request = createRequest(type: type, url: url, body: data, authHeader: authHeader)
        let task = createDataTask(from: request) { (data, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No Data")
                return
            }
            completion(data)
        }
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
    
    private func prepareJSONData(params: [String : Any]) -> Data? {
        let jsonData = try? JSONSerialization.data(withJSONObject: params)
        return jsonData
    }
        
    private func createRequest(type: RequestType, url: URL, body: Data?, authHeader: String?) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = type.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        if let authHeader = authHeader {
            request.setValue(authHeader, forHTTPHeaderField: "X-AUTH-TOKEN")
        }
        return request
    }
    
    private func creareUrl(from path: String) -> URL? {
//        return URL(string: API.scheme.rawValue + "://" + API.host.rawValue + path)
        
        var components = URLComponents()
        components.scheme = API.scheme.rawValue
        components.host = API.host.rawValue
        components.path = path
        return components.url ?? nil
    }
}
