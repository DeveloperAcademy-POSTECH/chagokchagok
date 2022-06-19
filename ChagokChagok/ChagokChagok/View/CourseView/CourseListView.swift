//
//  courseListView.swift
//  ChagokChagok
//
//  Created by Youngwoong Choi on 2022/06/14.
//

import SwiftUI

struct CourseListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedCategory: [String] = []

    @FetchRequest(entity: Course.entity(), sortDescriptors: [],
        animation: .default) private var courses: FetchedResults<Course>

    var body: some View {
        GeometryReader { geo in
            VStack {
                Button(action: addcourse) {
                    Text("생성")
                }
                .buttonStyle(.borderedProminent)

                CourseCategoryScroll(selectedCategory: $selectedCategory)
                    .padding(EdgeInsets(top: 33.0, leading: 20.0, bottom: 0, trailing: 0))
                Text("Total")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color.black)
                    .opacity(0.6)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 24.0, leading: 20.0, bottom: 0, trailing: 0))

                if selectedCategory.isEmpty {
                    List {
                        ForEach(courses) { course in
                            ZStack {
                                NavigationLink(destination: CourseDetailView(course: course)) {
                                    EmptyView()
                                }
                                .opacity(0)
                                ListCellForCourse(course: course)
                                    .frame(width: geo.size.width * 0.9, height: 104, alignment: .leading)
                            }
                        }
                        .onDelete(perform: deletecourses)
                    }
                    .listStyle(.plain)
                } else {
                    List {
                        ForEach(courses) { course in
                            if selectedCategory.contains(course.category ?? "") {
                                ZStack {
                                    NavigationLink(destination: CourseDetailView(course: course)) {
                                        EmptyView()
                                    }
                                    .opacity(0)
                                    ListCellForCourse(course: course)
                                        .frame(width: geo.size.width * 0.9, height: 104, alignment: .leading)
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .frame(width: geo.size.width, height: geo.size.height * 0.9, alignment: .top)
        }
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
