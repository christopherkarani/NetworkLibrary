//
//  Post.swift
//  NetworkLibrary
//
//  Created by Christopher Brandon Karani on 02/06/2018.
//  Copyright © 2018 Christopher Brandon Karani. All rights reserved.
//

import Foundation

extension Data {
    var stringDescription: String {
        return String(data: self, encoding: .utf8)!
    }
}

struct URLManager {
    static let posts = URL(string: "https://jsonplaceholder.typicode.com/posts")!
}

struct Post: Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}

extension Post {
    static let all = Resource<[Post]>(url: URLManager.posts) { data in
        return try! JSONDecoder().decode([Post].self, from: data)
    }
}
