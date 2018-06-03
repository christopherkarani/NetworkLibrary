//
//  Webservice.swift
//  NetworkLibrary
//
//  Created by Christopher Brandon Karani on 02/06/2018.
//  Copyright © 2018 Christopher Brandon Karani. All rights reserved.
//

import Foundation

enum WebserviceError: Error {
    case notAuthenticated
    case general(String)
}

func logError<A>(_ result: Result<A>) {
    guard case .failure(let e) = result else { return }
    assert(false, "\(e)")
}

class Webservice {
    func load<A>(_ resource: Resource<A>, completion: @escaping (Result<A>) -> () ) {
        let request = URLRequest(resource: resource)
        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else { return }
//            completion(resource.parse(data))
            let result: Result<A>
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 401 {
                result = Result(WebserviceError.general("Error Response"))
            }
        }.resume()
    }
}
