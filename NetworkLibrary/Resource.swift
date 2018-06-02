//
//  Resource.swift
//  NetworkLibrary
//
//  Created by Christopher Brandon Karani on 02/06/2018.
//  Copyright © 2018 Christopher Brandon Karani. All rights reserved.
//

import Foundation



/*
 budles up information about the endpoint and the parsing function
 
 */
struct Resource<T> {
    let url: URL
    let parse : (Data) -> T?
}
