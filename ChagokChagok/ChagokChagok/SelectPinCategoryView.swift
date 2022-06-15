//
//  SelectPinCategoryView.swift
//  ChagokChagok
//
//  Created by LeeJiSoo on 2022/06/15.
//

import SwiftUI

struct SelectPinCategoryView: View {
    // TODO: 해당 pin/course 가 어떤 카테고린지 받아와야함
    @State var currentCategory = PinCategory.cafe.rawValue
    let column = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        VStack {
            selectCategoryImage()
        }
    }
    
    private func selectCategoryImage() -> some View {
        LazyVGrid(columns: column, spacing: 10) {
            ForEach(PinCategory.allCases, id: \.rawValue) { value in
                Button(action: {
                    currentCategory = value.rawValue
                    // action
                }, label: {
                    VStack {
                        Group {
                            if currentCategory == value.rawValue {
                                value.categoryImage
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .overlay(
                                            RoundedRectangle(cornerRadius: 50)
                                                .stroke(.blue, lineWidth: 3)
                                                .padding(10))
                            } else {
                                value.categoryImage
                                    .resizable()
                                    .frame(width: 100, height: 100)
                            }
                            selectCategoryText(value: value.rawValue)
                        }
                    }
                })
                .padding(.bottom, 42)
            }
        }
        .padding(24)
    }
    
    private func selectCategoryText(value: String) -> some View {
        Text(value)
            .font(.system(size: 18))
            .foregroundColor(self.currentCategory == value ? .blue : .black)
    }
}

struct SelectPinCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SelectPinCategoryView()
    }
}
