//
//  main.swift
//  NetworkLibrary
//
//  Created by Christopher Brandon Karani on 02/06/2018.
//  Copyright © 2018 Christopher Brandon Karani. All rights reserved.
//

import Foundation


let webservice = Webservice()
let cachedWebService = CachedWebService(webservice)

cachedWebService.load(Post.all) { (result) in
    switch result {
    case .success(let posts):
        print("Success, Array Count:", posts.count)
    case .failure(let error):
        print("Failure: \(error.localizedDescription)")
    }
}


RunLoop.main.run(until: Date(timeIntervalSinceNow: 15))
