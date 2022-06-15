//
//  FavoriteButton.swift
//  ChagokChagok
//
//  Created by Youngwoong Choi on 2022/06/13.
//

import SwiftUI

struct FavoriteButton: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Pin.date, ascending: true)],
        animation: .default) private var pins: FetchedResults<Pin>
    
    var pin = Pin()
    
    var body: some View {
        Button {
            pin.isFavorite.toggle()
        } label: {
            Image(systemName: pin.isFavorite ? "heart.fill" : "heart")
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton()
    }
}
