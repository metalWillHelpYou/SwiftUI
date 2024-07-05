//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by metalWillHelpYou on 28.06.2024.
//

import Foundation
import SwiftUI
import MapKit

class LocationViewModel: ObservableObject {
    //All locations
    @Published var locations: [Location]
    //Current location
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationsList = false
    
    @Published var sheetLocation: Location? = nil

    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first ?? LocationsDataService.defaultLocation
        self.updateMapRegion(location: locations.first ?? LocationsDataService.defaultLocation)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
            )
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print ("Could not find current index in array")
            return
        }
        
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
