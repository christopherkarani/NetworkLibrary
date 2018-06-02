//
//  HttpMethod.swift
//  NetworkLibrary
//
//  Created by Christopher Brandon Karani on 02/06/2018.
//  Copyright © 2018 Christopher Brandon Karani. All rights reserved.
//

import Foundation

enum HttpMethod {
    case get
    case post
}
extension HttpMethod: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        }
    }
}
