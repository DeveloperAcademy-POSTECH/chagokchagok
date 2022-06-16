//
//  LatiLongiView.swift
//  ChagokChagok
//
//  Created by seojeon22 on 2022/06/16.
//

import SwiftUI
import CoreLocationUI
import MapKit

struct LatiLongiView: View {
    @StateObject var locationViewModel = LatiLongiModel()
    
    var body: some View {
        switch locationViewModel.authorizationStatus {
        case .notDetermined:
            AnyView(RequestLocationView())
                .environmentObject(locationViewModel)
        case .authorizedAlways, .authorizedWhenInUse:
            TrackingView()
                .environmentObject(locationViewModel)
        default:
            Text("서비스 이용을 위해 위치 공유를 허용해주세요")
        }
    }
}

struct RequestLocationView: View {
    @EnvironmentObject var locationViewModel: LatiLongiModel
    
    var body: some View {
        VStack {
            Button(action: {
                locationViewModel.requestPermission()
            }, label: {
                Label("드라이브 출발 전 위치 공유 동의", systemImage: "location")
            })
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
        }
    }
}

struct TrackingView: View {
    @EnvironmentObject var locationViewModel: LatiLongiModel
    
    var body: some View {
        VStack {
            Button(action: {
                print("\(coordinate!.latitude) and \(coordinate!.longitude)")
            }, label: {
                Label("내 위치 print하기", systemImage: "location")
            })
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            HStack {
                Text("Latitude:")
                Text("\(coordinate?.latitude ?? 0)")
            }
            
            HStack {
                Text("Longitude:")
                Text("\(coordinate?.longitude ?? 0)")
            }
        }
    }
    
    var coordinate: CLLocationCoordinate2D? {
        locationViewModel.lastSeenLocation?.coordinate
    }
}

struct LatiLongiView_Previews: PreviewProvider {
    static var previews: some View {
        LatiLongiView()
    }
}
