//
//  DetailsPresenter.swift
//  vipertest
//
//  Created by Jonn Alves on 11/02/23.
//

import Foundation
import Combine


class DetailsPresenter : ObservableObject{
    
    @Published var amiibo : Amiibo? = nil
    @Published var error: Bool = false
    
    var interector: DetailsInterector
    
    init(interector:DetailsInterector){
        self.error = false
        self.interector = interector
    }
    
    func getDetails(tail:String){
        self.error = false
        interector.loadDetail(tail: tail, callback: { amiibo in
            if amiibo == nil {
                self.error = true
            } else {
                self.amiibo = amiibo!
            }
        })
    }
   
}
