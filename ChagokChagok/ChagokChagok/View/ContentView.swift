//
//  ContentView.swift
//  ChagokChagok
//
//  Created by LeeJiSoo on 2022/06/08.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [
            NSSortDescriptor(keyPath: \Pin.name, ascending: true),
            NSSortDescriptor(keyPath: \Pin.memo, ascending: true),
            NSSortDescriptor(keyPath: \Pin.latitude, ascending: true),
            NSSortDescriptor(keyPath: \Pin.longitude, ascending: true),
            NSSortDescriptor(keyPath: \Pin.createTime, ascending: true),
            NSSortDescriptor(keyPath: \Pin.category, ascending: true)])
        var pin: FetchedResults<Pin>
    
    @State private var showingAddPinView = false
    @State private var name = ""
    @State private var memo = ""
    @State private var latitude = 0.0
    @State private var longitude = 0.0
    @State private var category = ""
    
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                Form {
                    Section {
                        TextField("Pin name", text: $name)
                        
                        VStack {
                            Text("latitude: \(latitude)")
                            Text("longitude: \(longitude)")
                            
                            TextField("Enter latitude", value: $latitude, formatter: formatter)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Enter longitude", value: $longitude, formatter: formatter)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        .padding()
                        
                        HStack {
                            Spacer()
                            Button("Save") {
                                DataController().addPin(name: name, memo: memo, latitude: latitude, longitude: longitude, category: category, context: managedObjContext)
                                dismiss()
                            }
                            Spacer()
                        }
                    }
                }
//
//                Text("지금까지 찍은 pin")
//                    .padding(.horizontal)
                
//                List {
//                    ForEach(pin) { pins in
//                        NavigationLink(destination: EditPinView(pin: pins)) {
//                            VStack {
//                                Text("\(pins.createTime!)")
//                                    .bold()
//                            }
//                        }
//                    }
//                    .onDelete(perform: deletePin)
//                }
//                .listStyle(.plain)
            }
            .navigationTitle("Pin 입력")
        }
    }
    
    private func deletePin(offsets: IndexSet) {
        withAnimation {
            offsets.map { pin[$0] }.forEach(managedObjContext.delete)
            DataController().save(context: managedObjContext)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
