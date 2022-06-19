import SwiftUI

struct ListCellForCourse: View {
    @FetchRequest(entity: Course.entity(), sortDescriptors: [],
                  animation: .default) private var courses: FetchedResults<Course>
    
    var course = Course()
    
    var body: some View {
        HStack {
            listImage
                .padding(.trailing, 16)
            listText
            Spacer()
            isfavoriteBtn
        }
        .frame(width: 350, height: 104)
    }
    
    private var listImage: some View {
        Image(course.category ?? "코스")
            .listIconStyle()
    }
    
    private var listText: some View {
        VStack(alignment: .leading, spacing: 7) {
            HStack {
                Image("courseIcon")
                    .resizable()
                    .frame(width: 16, height: 13, alignment: .leading)
                    .padding(.bottom, 6)
                Text(course.name ?? dateFormat.string(from: course.date!))
                    .listTitleStyle()
                    .listTextSpaceStyle()
            }
            .frame(width: 208, height: 22, alignment: .leading)
            Text(course.memo ?? "메모를 입력바랍니다아")
                .listMemoStyle()
                .listMemoSpaceStyle()
        }
    }
    
    private var isfavoriteBtn: some View {
        VStack {
            Button(action: {
                // action
            }, label: {
                Image(systemName: course.isFavorite ? "heart.fill" : "heart")
                    .frame(width: 20, height: 20, alignment: .topTrailing)
                    .padding(.top, 5)
            })
        }
    }
}
