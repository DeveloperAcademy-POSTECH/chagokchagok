//
//  PinListView.swift
//  ChagokChagok
//
//  Created by Youngwoong Choi on 2022/06/10.
//

import SwiftUI

struct PinListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Pin.date, ascending: false)], animation: .default) private var pins: FetchedResults<Pin>
        
    @State private var selectedCategory: [String] = []
    
    var body: some View {
        VStack {
            Button(action: addPin) {
                Text("생성")
            }
            .buttonStyle(.borderedProminent)
            
            PinCategoryScroll(selectedCategory: $selectedCategory)
                .padding(EdgeInsets(top: 33.0, leading: 20.0, bottom: 0, trailing: 0))
            Text("Total ")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color.black)
                .opacity(0.6)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 24.0, leading: 20.0, bottom: 0, trailing: 0))
            
            if selectedCategory.isEmpty {
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
            } else {
                List {
                    ForEach(pins) { pin in
                        if selectedCategory.contains(pin.category ?? "") {
                            NavigationLink {
                                PinDetailView(pin: pin)
                            } label: {
                                ListCell(pin: pin)
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            Spacer()
        }
    }

    private func addPin() {
        withAnimation {
            let newPin = Pin(context: viewContext)
            newPin.id = UUID()
            newPin.date = Date()
            newPin.latitude = 36.0189315
            newPin.longitude = 129.3429384
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
