//
//  Location.swift
//  ChagokChagok
//
//  Created by seojeon22 on 2022/06/14.
//

import Foundation
import CoreLocation

struct Location: Identifiable, Equatable {

    let name: String
    let symbol: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    
    var id: String {
        name + symbol
    }
    
    // Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
