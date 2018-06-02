//
//  Resource.swift
//  NetworkLibrary
//
//  Created by Christopher Brandon Karani on 02/06/2018.
//  Copyright © 2018 Christopher Brandon Karani. All rights reserved.
//

import Foundation
///   budles up information about the endpoint and parse data into type T
/// - url: The Url endpoint
/// - parse: The transformation function done on data

struct Resource<T> {
    let url: URL
    let method: HttpMethod<Data>
    let parse : (Data) -> T?
}

extension Resource {
    ///  initializer that  defaults HttpMethod to `get`, also parses Any Instead of Data
    ///  for convenience purposes
    init(url: URL, parseJSON: @escaping (Any) -> T)  {
        self.url = url
        self.method = .get
        self.parse = { data in
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            return json.flatMap(parseJSON)
        }
    }
    
    /// An initializer for parseing Post resources, This initializer expects JSON for parsing
    init(_ url: URL, method: HttpMethod<Any>, parseJSON: @escaping (Any) -> T) {
        self.url = url
        switch method {
        case .get:
            self.method = .get
        case .post(let body):
            let json = try! JSONSerialization.data(withJSONObject: body, options: [])
            self.method = .post(json)
        }
        
        self.parse = { data in
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            return json.flatMap(parseJSON)
        }
    }
}

extension Resource where T: Decodable {
    /// An initializer for decodable Types
    init(url: URL) {
        self.init(url: url, method: .get) { data in
            return try! JSONDecoder().decode(T.self, from: data)
        }
    }
}
