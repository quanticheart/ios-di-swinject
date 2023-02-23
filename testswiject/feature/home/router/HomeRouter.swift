//
//  AmiiboRouter.swift
//  vipertest
//
//  Created by Jonn Alves on 08/02/23.
//

import Foundation
import Swinject

class HomeRouter{
    func goToDetails(tail:String) -> DetailView {
        return Container.detailsContainer.resolve(DetailView.self, argument: tail)!
    }
}
