import SwiftUI

struct ListCellForCourse: View {
    @FetchRequest(entity: Course.entity(), sortDescriptors: [],
        animation: .default) private var courses: FetchedResults<Course>
    
    var course = Course()
    
    var body: some View {
        HStack {
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 76, height: 76)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image("tempTypeImage")
                        .resizable()
                        .frame(width: 13, height: 10, alignment: .leading)
                    Text("코스")
                        .foregroundColor(.gray)
                        .font(.system(size: 10))
                }
                .frame(width: 40, height: 20)
                Text(course.name ?? "임시 제목")
                    .bold()
                    .font(.system(size: 18))
                    .padding(.bottom, 5)
                Text(course.memo ?? "메모를 입력해주세요.")
                    .font(.system(size: 14))
                    .lineLimit(1)
            }
            Spacer()
            VStack {
                FavoriteButtonForCourse(course: course)

                Spacer()
            }
        }
        .frame(width: 350, height: 92)
    }
}

//struct ListCell_Previews: PreviewProvider {
//    static var previews: some View {
//        var pin = Pin()
//
//        ListCell(pin: pin)
//            .previewLayout(.sizeThatFits)
//    }
//}
