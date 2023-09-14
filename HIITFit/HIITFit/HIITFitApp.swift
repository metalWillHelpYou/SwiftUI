//
//  HIITFitApp.swift
//  HIITFit
//
//  Created by metalwillhelpyou on 17.07.2023.
//

import SwiftUI

@main
struct HIITFitApp: App {
    @StateObject private var historyStore = HistoryStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(historyStore)
                .alert(isPresented: $historyStore.loadingError) {
                    Alert(title: Text("History"),
                          message: Text(
                        """
                        Sorry, we can't load your past history.
                        Support: support@icloud.com
                        """))
                }
        }
    }
}
