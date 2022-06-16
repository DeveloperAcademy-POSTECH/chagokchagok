//
//  LocationsView.swift
//  ChagokChagok
//
//  Created by seojeon22 on 2022/06/14.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    @StateObject private var lm = LocationManager()
    
    var body: some View {
            ZStack {
                mapLayer
                
                VStack(spacing: 0) {
                    Spacer()
                    pinList
                    Button(action: blink) {
                        locationsPreviewStack.padding(EdgeInsets(top: 10, leading: 0, bottom: 30, trailing: 0))
                    }
                }
            }
            .ignoresSafeArea()
    }
    
    func blink() {
        print("blink")
    }
}

extension LocationsView {
    private var pinList: some View {
        // **** 액션에 핀 리스트 뷰 페이지 연결하기 ****
        NavigationLink(destination: LocationsListView(), label: {
            Text("전체 핀 목록")
                .font(.footnote)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .frame(width: 80, height: 40)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
        })
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $lm.mapRegion,
            showsUserLocation: true,
            annotationItems: vm.locations,
            annotationContent: { location in MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {

            LocationMapAnnotationView()
                .scaleEffect(vm.mapLocation == location ? 1.1 : 0.8)
                .shadow(radius: 10)
                .onTapGesture {
                    vm.showNextLocation(location: location)
                }
        }
        })
    }
    
    private var locationsPreviewStack: some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                }
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
