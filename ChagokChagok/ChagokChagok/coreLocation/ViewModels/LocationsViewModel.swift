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
    @Published var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 36.0189315, longitude: 129.3429384),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
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
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Pin.date, ascending: false)],
        animation: .default) private var pins: FetchedResults<Pin>
    
//    // All loaded locations
//    @Published var locations: [Pin]
    
    // Current location on map
    @Published var mapLocation: Pin?
    
    // Show location detail via sheet
    @Published var sheetLocation: Pin?
    
//    init() {
//        let locations = LocationsDataService.locations
//        self.locations = [Pin]
//        self.mapLocation = .empty
//                self.updateMapRegion(location: locations.first!)
//    }

    func showNextLocation(location: Pin) {
        withAnimation(.easeInOut) {
            mapLocation = location
//            showLocationsList = false
        }
    }
    
}

class LatiLongiModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var authorizationStatus: CLAuthorizationStatus
    @Published var lastSeenLocation: CLLocation?
    @Published var currentPlacemark: CLPlacemark?
    
    private let locationManager: CLLocationManager
    
    override init() {
        locationManager = CLLocationManager()
        authorizationStatus = locationManager.authorizationStatus
        
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastSeenLocation = locations.first
        fetchCountryAndCity(for: locations.first)
    }

    func fetchCountryAndCity(for location: CLLocation?) {
        guard let location = location else { return }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, _) in
            self.currentPlacemark = placemarks?.first
        }
    }
}
