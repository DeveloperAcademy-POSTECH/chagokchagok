//
//  PinListView.swift
//  ChagokChagok
//
//  Created by Youngwoong Choi on 2022/06/10.
//

import SwiftUI

struct PinListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Pin.date, ascending: false)],
        animation: .default) private var pins: FetchedResults<Pin>
    
    var body: some View {
        VStack {
            Button(action: addPin) {
                Text("생성")
            }
            .buttonStyle(.borderedProminent)
            
            List {
                ForEach(pins) { pin in
                    NavigationLink {
                        PinDetailView(pin: pin)
                    } label: {
                        ListCell(pin: pin)
                    }
                }
                .onDelete(perform: deletePins)
            }
            .listStyle(.plain)
            
            Spacer()
        }
    }

    private func addPin() {
        withAnimation {
            let newPin = Pin(context: viewContext)
            newPin.id = UUID()
            newPin.date = Date()
            newPin.longitude = 39.000
            newPin.latitude = 120.000
            newPin.isFavorite = false
            newPin.isEdited = false


            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                print("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deletePins(offsets: IndexSet) {
        withAnimation {
            offsets.map { pins[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct PinListView_Previews: PreviewProvider {
    static var previews: some View {
        PinListView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
