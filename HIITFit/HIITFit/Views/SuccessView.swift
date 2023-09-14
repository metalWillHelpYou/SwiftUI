//
//  SuccessView.swift
//  HIITFit
//
//  Created by metalwillhelpyou on 28.07.2023.
//

import SwiftUI

struct SuccessView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedTab: Int
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                Button("Continue") {
                    dismiss()
                    selectedTab = 9
                }
            }
            
            VStack() {
                Image(systemName: "hand.raised.fill")
                    
                    .foregroundColor(.purple)
                    .padding()
                
                Text("High Five!")
                    .font(.title)
                    .fontWeight(.bold)
                    
                Text("Goog job completing all four exersises!")
                Text("Remember tomorrow's another day.")
                Text("So eat well and get some rest")

            }

        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(selectedTab: .constant(3))
    }
}
