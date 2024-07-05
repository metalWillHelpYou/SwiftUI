//
//  LocationDetailView.swift
//  MapApp
//
//  Created by metalWillHelpYou on 29.06.2024.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @EnvironmentObject private var viewModel: LocationViewModel
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first ?? LocationsDataService.defaultLocation)
        .environmentObject(LocationViewModel())
}

extension LocationDetailView {
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            if let url = URL(string: location.link) {
                Link("Read more", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
}
