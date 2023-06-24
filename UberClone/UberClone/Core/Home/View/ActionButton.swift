//
//  ActionButton.swift
//  UberClone
//
//  Created by metalwillhelpyou on 04.04.2023.
//

import SwiftUI

struct ActionButton: View {
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                actionForState(mapState)
            }
        } label: {
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func actionForState(_ state: MapViewState) {
        switch state {
        case .noImput: print("No imput")
        case .searchingForLocation: mapState = .noImput
        case .locationSelected, .polylineAdded: mapState = .noImput
            viewModel.selectedUberLocation = nil
        }
    }
    
    func imageNameForState(_ state: MapViewState) -> String {
        switch state {
        case .noImput: return "line.3.horizontal"
        case .searchingForLocation , .locationSelected, .polylineAdded: return "arrow.left"
        }
    }
    
    struct ActionButton_Previews: PreviewProvider {
        static var previews: some View {
            ActionButton(mapState: .constant(.noImput))
        }
    }
}
