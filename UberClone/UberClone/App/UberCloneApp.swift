//
//  UberCloneApp.swift
//  UberClone
//
//  Created by metalwillhelpyou on 31.03.2023.
//

import SwiftUI

@main
struct UberCloneApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
