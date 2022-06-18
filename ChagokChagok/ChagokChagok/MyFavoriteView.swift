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
            //            myFavoriteCount()
            
            myFavoriteList()
            
            Spacer()
        }
    }
    
    private func myFavoriteList() -> some View {
        VStack {
            List {
                ForEach(pins) { pin in
                    ZStack {
                        NavigationLink(destination: PinDetailView(pin: pin)) {
                            EmptyView()
                        }
                        .opacity(0)
                        ListCell(pin: pin)
                    }
                }
                ForEach(courses) { course in
                    ZStack {
                        NavigationLink(destination: CourseDetailView(course: course)) {
                            EmptyView()
                        }
                        .opacity(0)
                        ListCellForCourse(course: course)
                    }
                }
            }
            .listStyle(.plain)
        }
    }
    
    //        private func myFavoriteCount() {
    //            ForEach(pins) { pin in
    //                pinCount += Int(pin.isFavorite)
    //            }
    //
    //            Text("Total \(pins.contains(Int(pin.isFavorite)))")
    //                .font(.system(size: 14))
    //                .frame(maxWidth: .infinity, alignment: .leading)
    //                .padding(.horizontal, 20)
    //        }
}

struct MyFavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        MyFavoriteView()
    }
}
