//
//  Cache.swift
//  NetworkLibrary
//
//  Created by Christopher Brandon Karani on 03/06/2018.
//  Copyright © 2018 Christopher Brandon Karani. All rights reserved.
//

import Foundation
/**
 Cache only deals with storing and retrieving cached data
 */

final class Cache {
    
    // default
    var baseUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    
    
    /// load data from the cache
    func load<A>(_ resource: Resource<A>) -> A? {
        let url = baseUrl.appendingPathComponent(resource.cacheKey)
        let data = try? Data(contentsOf: url)
        return data.flatMap(resource.parse)
    }
}
