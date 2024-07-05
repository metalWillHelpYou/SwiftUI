//
//  LocationListView.swift
//  MapApp
//
//  Created by metalWillHelpYou on 28.06.2024.
//

import SwiftUI

struct LocationListView: View {
    @EnvironmentObject private var viewModel: LocationViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                Button(action: {
                    viewModel.showNextLocation(location: location)
                }, label: {
                    listRawView(location: location)
                })
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    LocationListView()
        .environmentObject(LocationViewModel())
}

extension LocationListView {
    private func listRawView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
