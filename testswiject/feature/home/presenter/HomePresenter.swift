//
//  HomePresenter.swift
//  vipertest
//
//  Created by Jonn Alves on 08/02/23.
//

import Foundation
import SwiftUI
import Combine

class HomePresenter: ObservableObject{
    
    private var amiibosListRaw : [AmiiboSimple] = []
    @Published var amiibosList : [AmiiboSimple] = []
    private var r = [UUID]()
    
    var router: HomeRouter
    var interector: HomeInterector
    
    init(router: HomeRouter, interector:HomeInterector){
        self.router = router
        self.interector = interector
    }
    
}

extension HomePresenter {
    func loadList() {
        interector.loadList(callback: { list in
            self.amiibosList = list
            self.amiibosListRaw = list
            
        })
    }
    
    func setReaction(_ reaction: String, for item: AmiiboSimple) {
        self.r.appendIfNotContains(item.id)
    }
    
    func statusList(hideVisited:Bool){
        amiibosList = hideVisited ? amiibosList.filter {
            print($0)
            print(r.contains($0.id))
            return !r.contains($0.id)
        } : (amiibosListRaw)
    }
}
