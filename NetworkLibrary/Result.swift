//
//  Result.swift
//  NetworkLibrary
//
//  Created by Christopher Brandon Karani on 02/06/2018.
//  Copyright © 2018 Christopher Brandon Karani. All rights reserved.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

extension Result: CustomStringConvertible {
    /// The debug textual representation when written to an output stream, which includes whether the result was a value or error
    public var description: String {
        switch self {
        case .success: return "Success🎉"
        case .failure: return "Failure👎🏽"
        }
    }
}

extension Result: CustomDebugStringConvertible {
    /// The debug textual representation when written to an output stream, which includes whether the result was a value or error
    public var debugDescription: String {
        switch self {
        case .success(let value): return "Success: \(value)"
        case .failure(let error): return "Failure: \(error)"
        }
    }
}

extension Result {
    ///Resturns a value if self represents a success, otherwise nil
    public var value: Value? {
        switch self {
        case .success(let value): return value
        case .failure: return nil
        }
    }
    
    ///Returns a value if self represents an failure, otherwise nil
    public var error: Error? {
        switch self {
        case .success: return nil
        case .failure(let error): return error
        }
    }
    
    ///Returns a bollean representing if self is a success
    public var isSuccess: Bool {
        switch self {
        case .success: return true
        case .failure: return false
        }
    }
    
     ///Returns a bollean representing if self is a failure
    public var isFailure: Bool {
        switch self {
        case .success: return false
        case .failure: return true
        }
    }
}

// functional Extensions
extension Result {
    /// Evaluates the specified closure when the `Result` is a success, passing the unwrapped value as a parameter.
    ///
    /// Use the `map` method with a closure that does not throw. For example:
    ///
    ///     let possibleData: Result<Data> = .success(Data())
    ///     let possibleInt = possibleData.map { $0.count }
    ///     try print(possibleInt.unwrap())
    ///     // Prints "0"
    ///
    ///     let noData: Result<Data> = .failure(error)
    ///     let noInt = noData.map { $0.count }
    ///     try print(noInt.unwrap())
    ///     // Throws error
    ///
    /// - parameter transform: A closure that takes the success value of the `Result` instance.
    ///
    /// - returns: A `Result` containing the result of the given closure. If this instance is a failure, returns the
    ///            same failure.
    func map<U>(_ transform: (Value) -> U)  -> Result<U> {
        switch self {
        case .success(let value): return .success(transform(value))
        case .failure(let error): return .failure(error)
        }
    }
    
    /// Evaluates the specified closure when the `Result` is a success, passing the unwrapped value as a parameter.
    ///
    /// Use the `flatMap` method with a closure that may throw an error. For example:
    ///
    ///     let possibleData: Result<Data> = .success(Data(...))
    ///     let possibleObject = possibleData.flatMap {
    ///         try JSONSerialization.jsonObject(with: $0)
    ///     }
    ///
    /// - parameter transform: A closure that takes the success value of the instance.
    ///
    /// - returns: A `Result` containing the result of the given closure. If this instance is a failure, returns the
    ///            same failure.
    func flatMap<U>(_ transform: (Value) throws -> U) -> Result<U> {
        switch self {
        case .success(let value):
            do {
                return try .success(transform(value))
            } catch  {
                return .failure(error)
            }
        case .failure(let error):
            return .failure(error)
        }
    }
}
















