//
//  Webservice.swift
//  NetworkLibrary
//
//  Created by Christopher Brandon Karani on 02/06/2018.
//  Copyright © 2018 Christopher Brandon Karani. All rights reserved.
//

import Foundation



class Webservice {
    func load<A>(_ resource: Resource<A>, completion: @escaping (A?) -> () ) {
        URLSession.shared.dataTask(with: resource.url) { data, _, error in
            guard let data = data else { return }
            completion(resource.parse(data))
        }.resume()
    }
}
