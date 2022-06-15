//
//  courseListView.swift
//  ChagokChagok
//
//  Created by Youngwoong Choi on 2022/06/14.
//

import SwiftUI

struct CourseListView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Course.entity(), sortDescriptors: [],
        animation: .default) private var courses: FetchedResults<Course>
        
    var body: some View {
        VStack {
            Button(action: addcourse) {
                Text("생성")
            }
            .buttonStyle(.borderedProminent)
            
            List {
                ForEach(courses) { course in
                    NavigationLink {
                        CourseDetailView(course: course)
                    } label: {
                        Text(course.name ?? "")
                            ListCellForCourse(course: course)
                    }
                }
                .onDelete(perform: deletecourses)
            }
            .listStyle(.plain)
            
            Spacer()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func addcourse() {
        withAnimation {
            let newCourse = Course(context: viewContext)
            newCourse.id = UUID()
            newCourse.date = Date()
            newCourse.isFavorite = false
            newCourse.isEdited = false

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deletecourses(offsets: IndexSet) {
        withAnimation {
            offsets.map { courses[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)

    }
}
