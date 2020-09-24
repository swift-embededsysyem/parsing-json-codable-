//
//  HiringElement.swift
//  employeeApp1
//
//  Created by akbar  Rizvi on 4/2/20.
//  Copyright © 2020 akbar  Rizvi. All rights reserved.
//



// MARK: - JsonStructHiringElement

import Foundation

struct HiringElement: Decodable {
    let id, listId: Int
    let name: String?
}

@propertyWrapper
struct IgnoreFailure<Value: Decodable>: Decodable {
    var wrappedValue: [Value] = []
    
    private struct _None: Decodable {}
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        while !container.isAtEnd {
            if let decoded = try? container.decode(Value.self) {
                wrappedValue.append(decoded)
            }
            else {
                _ = try? container.decode(_None.self)
            }
        }
    }
}















