import SwiftUI

struct MyFavoriteView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [], predicate: NSPredicate(format: "isFavorite == %@", "1"), animation: .default) private var pins: FetchedResults<Pin>
    @FetchRequest(entity: Course.entity(), sortDescriptors: [], predicate: NSPredicate(format: "isFavorite == %@", "1"),
                  animation: .default) private var courses: FetchedResults<Course>
    
    var pin = Pin()
    var course = Course()

    var body: some View {
        VStack {
            if pins.count + courses.count == 0 {
                replaceText
            } else {
                Text("Total \(pins.count + courses.count)")
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 40, leading: 16, bottom: 20, trailing: 16))
                myFavoriteList()
            }
        }
    }
    
    var replaceText: some View {
        Text("😃 아무고토없지롱 즐겨찾기를 눌러주세염.")
            .bold()
    }
    
    private func myFavoriteList() -> some View {
        List {
            ForEach(pins) { pin in
                NavigationLink {
                    PinDetailView(pin: pin)
                } label: {
                    ListCell(pin: pin)
                }
            }
            
            ForEach(courses) { course in
                NavigationLink {
                    CourseDetailView(course: course)
                } label: {
                    ListCellForCourse(course: course)
                }
            }
        }
        .listStyle(.plain)
    }
}

struct MyFavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        MyFavoriteView()
    }
}
