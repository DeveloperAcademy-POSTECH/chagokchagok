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
        .frame(width: 350, height: 92)
    }
    
    var listImage: some View {
        Image(course.category ?? "코스")
            .listIconStyle()
    }
    
    var listText: some View {
        VStack(alignment: .leading, spacing: 7) {
            HStack {
                Image("courseIcon")
                    .resizable()
                    .frame(width: 16, height: 13, alignment: .leading)
                    .padding(.bottom, 6)
//                Text(data.type == 1 ? "tempTypeImage" : "tmepTypeImage")
//                    .foregroundColor(.gray)
//                    .font(.system(size: 12))
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
