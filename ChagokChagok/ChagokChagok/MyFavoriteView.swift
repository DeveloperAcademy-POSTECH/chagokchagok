import SwiftUI

struct MyFavoriteView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [], predicate: NSPredicate(format: "isFavorite == %@", "1"), animation: .default) private var pins: FetchedResults<Pin>
    @FetchRequest(entity: Course.entity(), sortDescriptors: [], predicate: NSPredicate(format: "isFavorite == %@", "1"),
                  animation: .default) private var courses: FetchedResults<Course>
    
    var pin = Pin()
    var course = Course()
    @State private var count = 0
    
    var body: some View {
        VStack {
            myFavoriteList()
            Spacer()
        }
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
