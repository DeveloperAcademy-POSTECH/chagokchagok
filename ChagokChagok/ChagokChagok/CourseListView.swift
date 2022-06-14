import SwiftUI

struct CourseListView: View {

    @State var selectedItems: [String] = []
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 24, weight: .medium))
                    .padding(.trailing, 15.0)
                Text("내 코스")
                    .font(.system(size: 24, weight: .bold))
            }
            .padding(.leading, 20.0)
            .padding(.top, 60.0)
            .frame(maxWidth: .infinity, alignment: .leading)
            CategoryScroll(selectedItems: $selectedItems)
                .padding(.top, 33.0)
                .padding(.leading, 20.0)
            Text("Total ")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color.black)
                .opacity(0.6)
                .padding(.leading, 20.0)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 24.0)
            FilteredList(selected: $selectedItems) // 선택된 인덱스와 전체 카테고리 목록을 넘겨줌
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
