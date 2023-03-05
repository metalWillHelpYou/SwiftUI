//
//  iDineApp.swift
//  iDine
//
//  Created by metalWillHelpYou on 01.03.2023.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
