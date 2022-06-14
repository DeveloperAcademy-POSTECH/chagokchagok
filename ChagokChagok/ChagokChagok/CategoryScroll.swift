import SwiftUI

enum Categories: String, CaseIterable, Equatable { //TODO: CategoryData 내부 카테고리와 연결 필요
    case forest = "자연"
    case ocean = "맛집"
    case photo = "포토존"
    case city = "도심"
    case night = "야경"
    case flower = "꽃길"
}

struct CategoryScroll: View {

    @Binding var selectedItems: [Categories.RawValue]
    
    var body: some View {
            ScrollView(.horizontal) {
                HStack(spacing: 8.0) {
                    ForEach(Categories.allCases, id: \.self) { item in
                        CategoryList(item: item.rawValue, selected: $selectedItems)
                    }
                }
            }
    }
}

struct CategoryList: View {
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
                .foregroundColor(selected.contains(item) ? .white : .black)
        })
        .frame(height: 30)
        .font(.system(size: 14.0, weight: selected.contains(item) ? .semibold : .medium))
        .padding(.horizontal, 20.0)
        .background(selected.contains(item) ? Color.blue : Color.gray)
        .cornerRadius(15.0)
    }
}
/*
struct CategoryScroll_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScroll()
    }
}
*/
