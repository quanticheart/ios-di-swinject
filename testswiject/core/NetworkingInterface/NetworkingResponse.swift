//
//  NetworkingResponse.swift
//  testswiject
//
//  Created by Jonn Alves on 22/02/23.
//

import Foundation

public struct NetworkingResponse<T> {
    public init(value: T, response: URLResponse) {
        self.value = value
        self.response = response
    }
    
    public let value: T
    let response: URLResponse
}
