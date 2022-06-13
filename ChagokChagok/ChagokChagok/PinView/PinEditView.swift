//
//  PinEditView.swift
//  ChagokChagok
//
//  Created by Youngwoong Choi on 2022/06/11.
//

import SwiftUI

struct PinEditView: View {
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) private var viewContext
    
    var pin = Pin()
    @State var textFieldName: String
    @State var textFieldMemo: String
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 80, height: 80, alignment: .leading)
                    
                    Text("풍경") // ToDo: 추후 pin.category로 변경
                        .font(.subheadline)
                        
                }.padding(.trailing)
                
                VStack {
                    HStack {
                        TextField(pin.name!, text: $textFieldName)
                            .font(.title)
                            .keyboardType(.default)
                            .foregroundColor(.blue)
                            
                        Spacer()
                    }.frame(height: 80)
                    HStack {
                        Text("경상북도 포항항 (좌표->주소)")
                        Text("|")
                            .foregroundColor(.secondary)
                        Text(dateFormat.string(from: pin.date!))
                        
                        Spacer()
                    }
                    .font(.subheadline)
                    .lineLimit(1)
                }
            }.padding()
   
            TextEditor(text: $textFieldMemo)
                .frame(width: 350, height: 200, alignment: .topLeading)
                .border(.gray, width: 1)
                .cornerRadius(5)
                .foregroundColor(.blue)
            
            Spacer()
        }
        .navigationTitle("편집")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    updatePin(textFieldName: textFieldName, textFieldMemo: textFieldMemo)
                } label: {
                    Text("저장")
                }
            }
        }
    }
    
    private func updatePin(textFieldName: String, textFieldMemo: String) {
        withAnimation { // 저장이 왜 안될까?
            pin.name = textFieldName
            pin.memo = textFieldMemo
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            self.presentation.wrappedValue.dismiss()
        }
        return()
    }
}

//struct PinEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        PinEditView()
//    }
//}
