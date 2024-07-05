//
//  MapAppApp.swift
//  MapApp
//
//  Created by metalWillHelpYou on 28.06.2024.
//

import SwiftUI

@main
struct MapAppApp: App {
    @StateObject private var viewModel = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(viewModel)
        }
    }
}
