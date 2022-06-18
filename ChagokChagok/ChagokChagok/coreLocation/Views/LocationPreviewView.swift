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
            titleSection
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.thickMaterial)
                .frame(width: 280, height: 100)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
        )
    }
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = "맛집" {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .cornerRadius(15)
            }
        }
        .background(Color.white)
        .cornerRadius(10)
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

// struct LocationPreviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Color.white.ignoresSafeArea()
//            
//            LocationPreviewView(location: LocationsDataService.locations.first!)
//                .padding()
//        }
//        .environmentObject(LocationsViewModel())
//    }
// }
