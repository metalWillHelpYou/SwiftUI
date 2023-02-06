//
//  Alerts.swift
//  TicTacToe
//
//  Created by metalWillHelpYou on 06.02.2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttomTitle: Text
}

struct AlertContext {
    static let humanWin    = AlertItem(title: Text("You win!"),
                                message: Text("You beat your own AI"),
                                buttomTitle: Text("Yeah"))
    
    static let computerWin = AlertItem(title: Text("You lost!"),
                                message: Text("Your AI is smarter than you"),
                                buttomTitle: Text("Rematch"))
    
    static let draw        = AlertItem(title: Text("Draw"),
                                message: Text("It was so epic"),
                                buttomTitle: Text("Try again"))
}

