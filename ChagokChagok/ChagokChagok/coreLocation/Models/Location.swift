//
//  Location.swift
//  ChagokChagok
//
//  Created by seojeon22 on 2022/06/14.
//

import Foundation
import CoreLocation

struct Location: Identifiable, Equatable {
    var id = UUID()
    let name: String
    let symbol: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    
    // Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
    static let empty: Location = Location(id: UUID(), name: "", symbol: "", coordinates: .init(latitude: .infinity, longitude: .infinity), description: "", imageNames: [])
}
