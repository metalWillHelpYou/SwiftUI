//
//  ToDoApp.swift
//  ToDo
//
//  Created by metalWillHelpYou on 01.05.2024.
//

import SwiftUI

@main
struct ToDoApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
