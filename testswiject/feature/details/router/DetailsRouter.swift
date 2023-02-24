//
//  DetailsRouter.swift
//  testswiject
//
//  Created by Jonn Alves on 24/02/23.
//

import Foundation
import Foundation
import Swinject

class DetailsRouter{
    private static let fakeRemoteConfig = false
    static func createModule(tail:String, id:Int? = nil) -> DetailView {
        if self.fakeRemoteConfig == true {
            return Container.detailsContainer.resolve(DetailView.self, arguments: tail, id)!
        } else {
            return Container.detailsContainer.resolve(DetailView.self, arguments: tail, id)!
        }
    }
}
