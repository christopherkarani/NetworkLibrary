//
//  main.swift
//  NetworkLibrary
//
//  Created by Christopher Brandon Karani on 02/06/2018.
//  Copyright © 2018 Christopher Brandon Karani. All rights reserved.
//

import Foundation


let webservice = Webservice()


webservice.load(Post.all) { (posts) in
    print("Done, Posts count:", posts!.count)
}

RunLoop.main.run(until: Date(timeIntervalSinceNow: 15))
