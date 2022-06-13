//
//  CategoryScroll.swift
//  ChagokChagok
//
//  Created by 윤가희 on 2022/06/12.
//s

import SwiftUI

enum Categories: String, CaseIterable, Equatable {
    case 숲길
    case 바다
    case 포토존
    case 도심
    case 야경
    case 꽃길
}

struct CategoryScroll: View {
    @State var selectedItems: [Categories] = []
    
    var body: some View {
            ScrollView(.horizontal) {
                HStack(spacing: 8.0) {
                    ForEach(Categories.allCases, id: \.self) { item in
                        CategoryList(item: item, selected: $selectedItems)
                    }
                }
            }
    }
}

struct CategoryList:View {
    let item: Categories
    @Binding var selected: [Categories]
    
    var body: some View {
        Button(action: {
            if selected.contains(item) {
                selected.removeAll { $0 == item}
            } else {
                selected.append(item)
            }
        }, label: {
            Text(item.rawValue)
                .tag(item)
                .foregroundColor(selected.contains(item) ? .white : .black)
        })
        .frame(height: 30)
        .font(.system(size: 14.0, weight: selected.contains(item) ? .semibold : .medium))
        .padding(.horizontal, 20.0)
        .background(selected.contains(item) ? Color.blue : Color.gray)
        .cornerRadius(15.0)
    }
}

struct CategoryScroll_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScroll()
    }
}