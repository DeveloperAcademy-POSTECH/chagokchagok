import SwiftUI

struct CourseCategoryScroll: View {
    @Binding var selectedCategory: [CourseCategory.RawValue]
    
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8.0) {
                    ForEach(CourseCategory.allCases, id: \.self) { item in
                        CourseCategoryList(item: item.rawValue, selected: $selectedCategory)
                    }
                }
            }
    }
}

struct CourseCategoryList: View {
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
