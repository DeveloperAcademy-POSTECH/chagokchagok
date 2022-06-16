//
//  PinCategoryScroll.swift
//  ChagokChagok
//
//  Created by 윤가희 on 2022/06/16.
//
import SwiftUI

struct PinCategoryScroll: View {
    @Binding var selectedCategory: [PinCategory.RawValue]
    
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8.0) {
                    ForEach(PinCategory.allCases, id: \.self) { item in
                        PinCategoryList(item: item.rawValue, selected: $selectedCategory)
                    }
                }
            }
    }
}

struct PinCategoryList: View {
    let item: String
    @Binding var selected: [String]
    
    var body: some View {
        Button(action: {
            if selected.contains(item) {
                selected.removeAll { $0 == item}
            } else {
                selected.append(item)
            }
        }, label: {
            Text(item)
                .tag(item)
                .foregroundColor(selected.contains(item) ? .white : .baseBlack)
        })
        .frame(height: 30)
        .font(.system(size: 14.0, weight: selected.contains(item) ? .semibold : .medium))
        .padding(.horizontal, 20.0)
        .background(selected.contains(item) ? Color.mainBlue : Color.tagGray)
        .cornerRadius(15.0)
    }
}
