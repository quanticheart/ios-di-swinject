//
//  DetailsInteractor.swift


import Foundation

class DetailsInterector {
    func loadDetail(tail:String, callback: @escaping (Amiibo?) -> Void ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let list:[Amiibo] = load("amiibo.json")
            var listFilter:[Amiibo] = []
            list.forEach{ amiibo in
                if amiibo.tail == tail {
                    listFilter.append(amiibo)
                }
            }
            
            if listFilter.count > 0 {
                callback(listFilter[0])
            }else {
                callback(nil)
            }
        }
    }
}
