//
//  HomeDI.swift
//  testswiject
//
//  Created by Jonn Alves on 23/02/23.
//

import Swinject

extension Container {
    public static let homeContainer: Container = {
        let container = Container()
        container.register(HomeRouter.self) { _ in
            HomeRouter()
        }
        container.register(HomeInterector.self) { _ in
            HomeInterector()
        }
        container.register(HomePresenter.self, factory: { resolver in
            HomePresenter(router: resolver.resolve(HomeRouter.self)!, interector: resolver.resolve(HomeInterector.self)!)

        })
        container.register(HomeView.self, factory: { resolver in
            HomeView(presenter: resolver.resolve(HomePresenter.self)!)
        })
        return container
    }()
}
