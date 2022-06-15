//
//  LocationsData.swift
//  ChagokChagok
//
//  Created by seojeon22 on 2022/06/14.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "영일대 가는 길",
            symbol: "풍경",
            coordinates: CLLocationCoordinate2D(latitude: 36.067623, longitude: 129.378681),
            description: "내용을 입력하세요.",
            imageNames: [
                "landScape"
            ]),
        
        Location(
            name: "형산강 텐트 스팟",
            symbol: "풍경",
            coordinates: CLLocationCoordinate2D(latitude: 35.999227, longitude: 129.343839),
            description: "내용을 입력하세요.",
            imageNames: [
                "landScape"
            ]),

        Location(
            name: "출근길에 신상 스벅",
            symbol: "카페",
            coordinates: CLLocationCoordinate2D(latitude: 36.063803, longitude: 129.371777),
            description: "내용을 입력하세요.",
            imageNames: [
                "cafe"
            ]),

        Location(
            name: "새로운 핀 1",
            symbol: "카페",
            coordinates: CLLocationCoordinate2D(latitude: 36.005027, longitude: 129.335111),
            description: "내용을 입력하세요.",
            imageNames: [
                "cafe"
            ]),

        Location(
            name: "새로운 핀 2",
            symbol: "음식점",
            coordinates: CLLocationCoordinate2D(latitude: 36.004050, longitude: 129.317125),
            description: "내용을 입력하세요.",
            imageNames: [
                "restaurant"
            ]),
    ]
}

