//
//  CourseListView.swift
//  ChagokChagok
//
//  Created by 윤가희 on 2022/06/14.
//

import SwiftUI

struct CourseListView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0){
                Image(systemName: "chevron.left")
                    .font(.system(size: 24, weight: .medium))
                    .padding(.trailing, 15.0)
                Text("내 코스")
                    .font(.system(size: 24, weight: .bold))
            }
            .padding(.leading, 20.0)
            .padding(.top, 60.0)
            .frame(maxWidth: .infinity, alignment: .leading)
            CategoryScroll()
                .padding(.top, 33.0)
                .padding(.leading, 20.0)
            Text("Total ")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color.black)
                .opacity(0.6)
                .padding(.leading, 20.0)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 24.0)
            ListCell(image: "tempPin", name: "멋진 동산", memo: "저기 진짜 맛있어보인다", createTime: "2022.03.12", type: "핀", isFavorite: true)
                .padding(.top, 18.0)
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
