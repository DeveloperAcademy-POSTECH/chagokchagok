//
//  PinDetailView.swift
//  ChagokChagok
//
//  Created by Youngwoong Choi on 2022/06/10.
//

import SwiftUI

struct PinDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Pin.date, ascending: true)],
        animation: .default) private var pins: FetchedResults<Pin>
    
    var pin = Pin()
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 76, height: 76, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(dateFormat.string(from: pin.date ?? Date()))
                        .font(.system(size: 15))
                        .foregroundColor(.gray)

                    Text(pin.name ?? "제목을 써주세요")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }
                .padding(.leading, 24)
                
                Spacer()
            }
            .frame(width: 350, height: 80, alignment: .leading)
            .padding(.top, 45)
            
            Rectangle() // 지도 들어갈 자리
                .frame(width: 350, height: 350)
                .cornerRadius(14)
                .padding(22)
            
            Text(pin.memo ?? "내용 없음")
                .font(.system(size: 15))
                .frame(width: 350, height: 100, alignment: .topLeading)
            
            Spacer()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
//                BackButton()
            }
            ToolbarItem(placement: .principal) {
                HStack {
                    Image(systemName: "mappin.circle.fill")
                    Text("핀")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    FavoriteButtonForPin(pin: pin)
                    
                    NavigationLink {
                        PinEditView(pin: pin, textFieldName: pin.name ?? "", textFieldMemo: pin.memo ?? "")
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
    }
}


//struct PinDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PinDetailView(pin: Pin(entity: $0, insertInto: .none))
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
