import SwiftUI

struct SelectCategoryView: View {
//    해당 pin/course 가 어떤 카테고린지 받아와야함
    @State var category = ""
    let column = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        VStack {
            selectCategoryImage()
        }
    }
    
    private func selectCategoryImage() -> some View {
        LazyVGrid(columns: column, spacing: 10) {
            ForEach(CourseCategory.allCases, id: \.rawValue) { value in
                Button(action: {
                    category = value.rawValue
                    // action
                }, label: {
                    VStack {
                        Group {
                            value.categoryImage
                                .resizable()
                                .frame(width: 100, height: 100)
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
            .foregroundColor(.black)
    }
}

struct SelectCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCategoryView()
    }
}
