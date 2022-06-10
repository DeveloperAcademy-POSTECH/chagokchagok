//
//  PinDetailView.swift
//  ChagokChagok
//
//  Created by Youngwoong Choi on 2022/06/10.
//

import SwiftUI

struct PinDetailView: View {
    
    var body: some View {
          
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")

                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }

                    }
                    .padding(.trailing)
                    
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                        
                        Text("핀")
                        
                        Spacer()
                    }
                    .foregroundColor(.gray)
                    .padding(.leading)
                    .padding(.bottom, 1)
                    
                    HStack {
                        Text("핀 이름")
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.leading)
                    
                    
                    HStack {
                        Text("2022. 01. 02")
                        Image(systemName: "dot")
                        Text("경상북도 포항시 어쩌고 저쩌고")
                        Spacer()
                    }
                    .padding()
                    
                    Rectangle() // 지도 들어갈 자리
                        .frame(width: 390, height: 300)
                    
                    Text("아이참재미있다")
                        .frame(width: 390, height: 100, alignment: .topLeading)
                        .border(.gray, width: 1)
                    
                    Spacer()

                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct PinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PinDetailView()
    }
}
