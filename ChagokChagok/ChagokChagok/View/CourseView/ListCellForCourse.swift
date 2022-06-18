import SwiftUI

struct ListCellForCourse: View {
    @FetchRequest(entity: Course.entity(), sortDescriptors: [],
                  animation: .default) private var courses: FetchedResults<Course>
    
    var course = Course()
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                listImage
                listText
                    .padding(.leading, 17)
                Spacer()
                isfavoriteBtn
            }
            .frame(width: geo.size.width, height: 104, alignment: .leading)
        }
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
    
    var isfavoriteBtn: some View {
        VStack {
            Image(systemName: course.isFavorite ? "heart.fill" : "heart")
                .frame(width: 20, height: 20, alignment: .topTrailing)
                .padding(.top, 5)
        }
    }
}
