import SwiftUI

struct ListCellForCourse: View {
    @FetchRequest(entity: Course.entity(), sortDescriptors: [],
        animation: .default) private var courses: FetchedResults<Course>
    
    var course = Course()
    
    var body: some View {
        HStack {
            listImage
            listText
            Spacer()
            isfavoriteBtn
        }
        .frame(width: 350, height: 92)
    }
    
    var listImage: some View {
        Image(course.category ?? "tempCategoryimage")
            .listIconStyle()
    }
    
    var listText: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image("tempTypeImage")
                    .resizable()
                    .frame(width: 13, height: 10, alignment: .leading)
//                Text(data.type == 1 ? "tempTypeImage" : "tmepTypeImage")
//                    .foregroundColor(.gray)
//                    .font(.system(size: 12))
            }
            .frame(width: 40, height: 20)
            Text(course.name ?? dateFormat.string(from: course.date!))
                .listTitleStyle()
                .listTextSpaceStyle()
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
            Spacer()
        }
    }
}
