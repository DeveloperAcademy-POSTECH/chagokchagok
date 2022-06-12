//
//  PinEditView.swift
//  ChagokChagok
//
//  Created by Youngwoong Choi on 2022/06/11.
//

import SwiftUI

struct PinEditView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var pin = Pin()
    @State var textFieldName: String
    @State var textFieldMemo: String
    
    var body: some View {
        HStack {
            Text("제목")
            TextField(pin.name!, text: $textFieldName)
        }
        HStack {
            Text("메모")
            TextField(pin.memo!, text: $textFieldMemo)
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
        withAnimation {
            pin.name = textFieldName
            pin.memo = textFieldMemo
        }
        return()
    }
}

//struct PinEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        PinEditView()
//    }
//}
