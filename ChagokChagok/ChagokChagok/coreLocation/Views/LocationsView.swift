//
//  LocationsView.swift
//  ChagokChagok
//
//  Created by seojeon22 on 2022/06/14.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [],
        animation: .default) private var pins: FetchedResults<Pin>
    
    var pin = Pin()
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
            ZStack {
                mapLayer
                VStack(spacing: 0) {
                    Spacer()
                    pinList
                    locationsPreviewStack.padding(EdgeInsets(top: 10, leading: 0, bottom: 30, trailing: 0))
                }
            }
            .ignoresSafeArea()
    }
}

extension LocationsView {
    private var pinList: some View {
        // **** 액션에 핀 리스트 뷰 페이지 연결하기 ****
        NavigationLink(destination: PinListView(), label: {
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
        Map(coordinateRegion: $locationManager.mapRegion,
            showsUserLocation: true,
            annotationItems: pins,
            annotationContent: { pin in MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: pin.latitude, longitude: pin.longitude)) {
            LocationMapAnnotationView()
                .scaleEffect(pin == pin ? 1.1 : 0.8)
                .shadow(radius: 10)
                .onTapGesture {
                    viewModel.showNextLocation(location: pin)
                }
        }
        })
    }
    
    private var locationsPreviewStack: some View {
        ZStack {
            ForEach(pins) { pin in
                if pin == pin {
                    NavigationLink(destination: {
                        PinDetailView(pin: pin)
                    }, label: {
                        LocationPreviewView(pin: pin)
                    })
                }
            }
        }
    }
}
