//
//  LocationsViewModel.swift
//  ChagokChagok
//
//  Created by seojeon22 on 2022/06/14.
//

import MapKit
import SwiftUI
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.05, longitude: 129.35), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    // set manager to CLLocationManager
    private let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("locationManagerDidChangeAuthorization")
        print(manager.authorizationStatus.self)
        switch manager.authorizationStatus {
        case .authorizedAlways:
            manager.startUpdatingLocation() // requestLocation()
        case .authorizedWhenInUse:
            manager.startUpdatingLocation()
        case .denied:
            break
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted:
            break
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("locationManager 위치 불러오기 ")
            locations.last.map {
                mapRegion = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                )
                print($0)
                manager.stopUpdatingLocation()
            }
        }
}

class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location
    
    // Show location detail via sheet
    @Published var sheetLocation: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = .empty
//                self.updateMapRegion(location: locations.first!)
    }

    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
//            showLocationsList = false
        }
    }
    
}
