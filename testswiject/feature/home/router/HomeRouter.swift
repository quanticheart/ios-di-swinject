//
//  AmiiboRouter.swift
//  vipertest
//
//  Created by Jonn Alves on 08/02/23.
//

import Foundation
import Swinject

class HomeRouter{
    func goToDetails(tail:String, id:Int?) -> DetailView {
        return DetailsRouter.createModule(tail:tail, id:id)
    }
    
    func goToDetails(tail:String) -> DetailView {
        return DetailsRouter.createModule(tail:tail)
    }
}
