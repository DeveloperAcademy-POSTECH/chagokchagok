//
//  PinDetailView.swift
//  ChagokChagok
//
//  Created by Youngwoong Choi on 2022/06/10.
//

import SwiftUI

struct PinDetailView: View {

    var pin = Pin()
    var pageTitle = HStack {
        Image(systemName: "mappin.circle.fill")
        Text("핀")
    }
    
    var body: some View {
          
        NavigationView {
                VStack {
                    HStack {
                        Circle()
                            .frame(width: 100, height: 100, alignment: .leading)
                            .padding(.trailing)

                        VStack {
                            HStack {
                                Text(pin.name!)
                                    .font(.title)
                                .fontWeight(.semibold)
                                
                                Spacer()
                            }
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
                        .border(.gray, width: 1)
                    Spacer()

                }
            }
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
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")

                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }
                    }
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

//struct PinDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PinDetailView()
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
