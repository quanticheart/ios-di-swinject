//
//  LoadingView.swift
//  vipertest
//
//  Created by Jonn Alves on 16/02/23.
//

import SwiftUI

struct LoadingView<Content: View>: View {
    var status = true
    var view : () -> Content
    
    init(status:Bool,@ViewBuilder view: @escaping () -> Content){
        self.status = status
        self.view = view
    }
    
    var body: some View {
        if(status) {
            ProgressView()
        } else {
            self.view()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(status: false){
            return Text("Carregou")
        }
    }
}
