//
//  DetailsDI.swift
//  testswiject
//
//  Created by Jonn Alves on 23/02/23.
//

import Foundation
import Swinject

extension Container {
    public static let detailsContainer: Container = {
        let container = Container()
        
        container.register(DetailsInterector.self) { _ in
            DetailsInterector()
        }
        container.register(DetailsPresenter.self, factory: { resolver in
            DetailsPresenter(interector: resolver.resolve(DetailsInterector.self)!)

        })
        container.register(DetailView.self, factory: { resolver, tail in
            DetailView(presenter: resolver.resolve(DetailsPresenter.self)!, tail: tail)
        })
        return container
    }()
}
