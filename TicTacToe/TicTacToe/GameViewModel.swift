//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by metalWillHelpYou on 06.02.2023.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    let colums: [GridItem] = [GridItem(.flexible()),
                              GridItem(.flexible()),
                              GridItem(.flexible())]
}
