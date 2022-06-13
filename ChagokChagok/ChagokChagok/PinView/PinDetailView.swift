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
        animation: .default) private var pins: FetchedResults<Pin> // Edit View에서 수정 후 Dismiss -> 즉각 결과를 반영해주기 위해 필요
    
    var pin = Pin()
    
    var body: some View {
                VStack {
                    HStack {
                        VStack {
                            Circle()
                                .foregroundColor(.gray)
                                .frame(width: 80, height: 80, alignment: .leading)
                            
                            Text("풍경") // ToDo: 추후 pin.category로 변경
                                .font(.caption)
                        }.padding(.trailing)

                        VStack {
                            HStack {
                                Text(pin.name!)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                
                                Spacer()
                            }.frame(height: 80)
                            HStack {
                                Text("경상북도 포항항 (좌표->주소)")
                                Text("|")
                                    .foregroundColor(.secondary)
                                Text(dateFormat.string(from: pin.date!))
                                
                                Spacer()
                            }
                            .font(.caption)
                            .lineLimit(1)
                        }
                    }
                    .padding()
                    
                    Rectangle() // 지도 들어갈 자리
                        .frame(height: 300)
                        .padding(.horizontal)
                    
                    Text(pin.memo ?? "내용 없음")
                        .frame(width: 360, height: 100, alignment: .topLeading)
                    Spacer()

                }
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Image(systemName: "mappin.circle.fill")
                            Text("핀")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            FavoriteButton(pin: pin)
                            
                            NavigationLink {
                                PinEditView(pin: pin, textFieldName: pin.name!, textFieldMemo: pin.memo!)
                            } label: {
                                Image(systemName: "square.and.pencil")
                            }
                        }
                    }
                }
    }
}

//private let itemFormatter: DateFormatter = {
//let formatter = DateFormatter()
//formatter.dateStyle = .short
//formatter.timeStyle = .none
//return formatter
//}()

//struct PinDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PinDetailView()
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
