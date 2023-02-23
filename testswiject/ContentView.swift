//
//  ContentView.swift
//  testswiject
//
//  Created by Jonn Alves on 22/02/23.
//

import SwiftUI
import Swinject

struct ContentView: View {
    var body: some View {
        Container.homeContainer.resolve(HomeView.self, argument: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Container.homeContainer.resolve(HomeView.self, argument: 1)
    }
}
