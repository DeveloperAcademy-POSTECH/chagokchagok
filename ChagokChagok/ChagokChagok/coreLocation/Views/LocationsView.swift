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
    var body: some View {
        ZStack(alignment: .top) {
            mapLayer
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
                locationsPreviewStack
            }
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in LocationDetailView(location: location)
        }
    }
}

extension LocationsView {
    private var header: some View {
        VStack(spacing: 0) {
            // ** 액션에 핀 리스트 뷰 페이지 연결 **
            Button(action: blink) {
                Text("전체 핀 목록")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(width: 150, height: 55)
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion, showsUserLocation: true, annotationItems: vm.locations, annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) { LocationMapAnnotationView()
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
                if vm.mapLocation == location { LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}

// header 버튼에 쓰일 임시 액션
func blink() {
    print("")
}
    
    struct LocationsView_Previews: PreviewProvider {
        static var previews: some View {
            LocationsView()
                .environmentObject(LocationsViewModel())
        }
    }
