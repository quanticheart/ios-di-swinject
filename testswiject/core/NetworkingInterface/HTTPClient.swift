//
//  HTTPClient.swift
//  testswiject
//
//  Created by Jonn Alves on 22/02/23.
//

import Combine
import Foundation

public protocol HTTPClient {
    func perform<T: Decodable>(_ request: URLRequest) -> AnyPublisher<NetworkingResponse<T>, Error>
}
