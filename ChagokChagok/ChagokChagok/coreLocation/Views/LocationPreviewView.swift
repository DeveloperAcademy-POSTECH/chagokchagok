//
//  LocationPreviewView.swift
//  ChagokChagok
//
//  Created by seojeon22 on 2022/06/14.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [],
        animation: .default) private var pins: FetchedResults<Pin>

    var pin = Pin()

    var body: some View {
        HStack(spacing: 24) {
            imageSection
                .padding(.leading, 9.0)
            titleSection
                .padding(.leading, 45.0)
            Spacer()
        }
        .padding()
        .background(
            Image("mapCard")
                .shadow(color: Color.black.opacity(0.16), radius: 20, x: 4, y: 4)
        )
    }
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = "tourspotImage" {
                Image(imageName)
                    .resizable()
                    .frame(width: 94, height: 94)
            }
        }
        .background(Color.white)
        .cornerRadius(47)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(pin.name ?? "나의 핀")
                .font(.title2)
                .fontWeight(.bold)
                .lineLimit(1)
            
            Text(pin.memo ?? "")
                .font(.subheadline)
                .lineLimit(1)
        }.padding()
    }
}

//struct LocationPreviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Color.white.ignoresSafeArea()
//            
//            LocationPreviewView(location: LocationsDataService.locations.first!)
//                .padding()
//        }
//        .environmentObject(LocationsViewModel())
//    }
//}
