//
//  ApplicationDI.swift
//  testswiject
//
//  Created by Jonn Alves on 23/02/23.
//

import Swinject

extension Container {
    static let AppContainer: Container = {
        let container = Container()
        container.register(HTTPClient.self, factory: {_ in URLSessionClient()}).inObjectScope(.container)
        return container
    }()
}
