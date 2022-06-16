//
//  LocationDetailView.swift
//  ChagokChagok
//
//  Created by seojeon22 on 2022/06/14.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                basicInfo
                
                Divider()
                
                mapLayerDetail
                
                Divider()
                
                memoField
            }
        }
        .background(.ultraThinMaterial)
        .overlay(backButton, alignment: .topLeading)
    }
}
    
extension LocationDetailView {
    private var basicInfo: some View {
        HStack {
        VStack {
            Image("restaurant")
            .resizable()
            .frame(width: 100, height: 100)
            .padding()
            
            Text("식당")
                .padding()
        }
            VStack {
                Spacer()
                
                Text("제목을 입력하세요")
                    .padding()
                
                Spacer()
                
                Text("2022-06-13")
                    .padding()
            }
            Image(systemName: "star")
                .padding()
                .offset(y: -30)
        }
    }
    
    private var mapLayerDetail: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),
            annotationItems: [location]) { location in MapAnnotation(coordinate: location.coordinates) {
            LocationMapAnnotationView()
                .shadow(radius: 10)
            }
        }
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
            .padding()
    }
    
    private var memoField: some View {
        Rectangle()
            .frame(width: 330, height: 300)
            .foregroundColor(.white)
            .border(.black, width: 1)
            .offset(x: 15)
            .padding()
            .textFieldStyle(.plain)
    }
    
    private var backButton: some View {
        Button {
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.accentColor)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
    }
}
