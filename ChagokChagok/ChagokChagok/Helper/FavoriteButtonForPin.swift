//
//  FavoriteButton.swift
//  ChagokChagok
//
//  Created by Youngwoong Choi on 2022/06/13.
//

import SwiftUI

struct FavoriteButtonForPin: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Pin.date, ascending: true)],
        animation: .default) private var pins: FetchedResults<Pin>
    
    var pin = Pin()
    
    var body: some View {
        Button {
            pin.isFavorite.toggle()
                
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        } label: {
            Image(systemName: pin.isFavorite ? "heart.fill" : "heart")
        }
    }
}

struct FavoriteButtonForPin_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButtonForPin()
    }
}
