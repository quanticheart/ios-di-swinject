//
//  testswijectApp.swift
//  testswiject
//
//  Created by Jonn Alves on 22/02/23.
//

import SwiftUI
import Swinject

@main
struct testswijectApp: App {
    var body: some Scene {
        WindowGroup {
            Container.homeContainer.resolve(HomeView.self)
        }
    }
}
