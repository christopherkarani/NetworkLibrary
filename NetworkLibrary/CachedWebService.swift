//
//  CachedWebService.swift
//  NetworkLibrary
//
//  Created by Christopher Brandon Karani on 03/06/2018.
//  Copyright © 2018 Christopher Brandon Karani. All rights reserved.
//

import Foundation
/**
 
 The idea behind the CachedWebservice class is to maintain a separation of concerns: the Webservice should only be concerned with executing network requests, while CachedWebservice adds the caching functionality on top.
 The CachedWebservice class can be looked at as a simple wrapper around Webserbice
 
 
 -parameters:
    -webservice: An Instance of the Webservice Class
 */
final class CachedWebService {
    let webservice: Webservice
    
    init(_ webservice: Webservice) {
        self.webservice = webservice
    }
    
    func load<A>(_ resource: Resource<A>, update: @escaping (A?) -> ()) {
        webservice.load(resource, completion: update)
    }
}

