//
//  main.swift
//  NetworkLibrary
//
//  Created by Christopher Brandon Karani on 02/06/2018.
//  Copyright © 2018 Christopher Brandon Karani. All rights reserved.
//

import Foundation


let webservice = Webservice()
let postUrl = URL(string: "https://jsonplaceholder.typicode.com/posts")!
let post = Post(id: 2, userId: 4, title: "hello", body: "Chris made this one")
let postJSON: [String : Any] = ["userId": 4, "title": "hello", "body": "Chris made this one"]



RunLoop.main.run(until: Date(timeIntervalSinceNow: 15))
