//
//  LocationPreviewView.swift
//  MapApp
//
//  Created by metalWillHelpYou on 29.06.2024.
//

import SwiftUI

struct LocationPreviewView: View {
    let location: Location
    @EnvironmentObject private var viewModel: LocationViewModel
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0)  {
            VStack(alignment: .leading, spacing: 16)  {
                imageSection
                titleSection
            }
            
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    LocationPreviewView(location: LocationsDataService.locations.first ?? LocationsDataService.defaultLocation)
        .padding()
        .environmentObject(LocationViewModel())
}


extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .bold()
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button(action: {
            viewModel.sheetLocation = location
        }, label: {
            Text("Learn more")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(width: 125)
                .padding()
                .background(.primary)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
    }
    
    private var nextButton: some View {
        Button(action: {
            viewModel.nextButtonPressed()
        }, label: {
            Text("Next")
                .font(.headline)
                .foregroundStyle(.red)
                .frame(width: 125)
                .padding()
                .background(Color(uiColor: .systemGray).opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
    }
}
