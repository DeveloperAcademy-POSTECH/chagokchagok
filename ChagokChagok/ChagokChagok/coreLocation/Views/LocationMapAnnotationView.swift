//
//  LocationMapAnnotationView.swift
//  ChagokChagok
//
//  Created by seojeon22 on 2022/06/14.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    let accentColor = Color(.blue)
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "location.fill.viewfinder")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(10)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 8, height: 8)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -1)
                .padding(.bottom, 20)
        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotationView()
    }
}
