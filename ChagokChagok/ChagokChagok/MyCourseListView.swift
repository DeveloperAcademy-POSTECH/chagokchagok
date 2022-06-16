//
//  MyCourseListView.swift
//  ChagokChagok
//
//  Created by 윤가희 on 2022/06/15.
//
import SwiftUI

struct MyCourseListView: View {

    @State private var selectedCategory: [String] = []
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 24, weight: .medium))
                    .padding(.trailing, 15.0)
                Text("내 코스")
                    .font(.system(size: 24, weight: .bold))
            }
            .padding(EdgeInsets(top: 60.0, leading: 20.0, bottom: 0, trailing: 0))
            .frame(maxWidth: .infinity, alignment: .leading)
            CategoryScroll(selectedCategory: $selectedCategory)
                .padding(EdgeInsets(top: 33.0, leading: 20.0, bottom: 0, trailing: 0))
            Text("Total ")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color.black)
                .opacity(0.6)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 24.0, leading: 20.0, bottom: 0, trailing: 0))
            FilteredList(selectedCategory: $selectedCategory) // 선택된 인덱스와 전체 카테고리 목록을 넘겨줌
            Spacer()
            }
            .ignoresSafeArea()
    }
}

struct MyCourseListView_Previews: PreviewProvider {
    static var previews: some View {
        MyCourseListView()
    }
}
