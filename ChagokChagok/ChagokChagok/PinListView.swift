//
//  PinListView.swift
//  ChagokChagok
//
//  Created by Youngwoong Choi on 2022/06/10.
//

import SwiftUI

struct PinListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Pin.date, ascending: true)],
        animation: .default) private var pins: FetchedResults<Pin>
    
    @State var textFieldInsert: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("입력", text: $textFieldInsert)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button(action: addPin) {
                    Text("저장")
                }
                .buttonStyle(.borderedProminent)
                
                List {
                        ForEach(pins) { pin in
                            NavigationLink {
                                Text("핀 상세 페이지로 갈아끼우기")
                            } label: {
                                
                                HStack {
                                    Rectangle() //핀 대표 이미지로 교체
                                        .frame(width: 80, height: 80, alignment: .leading)
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                            Text(pin.name ?? "값 없음")
                                                .font(.title3)
                                                .fontWeight(.bold)

                                            Text(pin.memo ?? "값 없음")
                                                .font(.body)
                                            
                                        Text(itemFormatter.self.string(from: pin.date ?? Date.now))
                                    }
                                    Spacer()
                                    
                                    VStack {
                                        Image(systemName: "heart")
                                            .resizable()
                                            .frame(width: 15, height: 15)
                                        Spacer()
                                    }
                                }
                            }
                        }
                        .onDelete(perform: deletePins)
                    }
                .listStyle(.plain)
            }
        }
    }

    private func addPin() {
        withAnimation {
            let newPin = Pin(context: viewContext)
            newPin.id = UUID()
            newPin.name = textFieldInsert
            newPin.memo = ""
            newPin.date = Date()
            textFieldInsert = ""

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
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

private let itemFormatter: DateFormatter = {
let formatter = DateFormatter()
formatter.dateStyle = .short
formatter.timeStyle = .none
return formatter
}()

struct PinListView_Previews: PreviewProvider {
    static var previews: some View {
        PinListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
