//
//  FavoriteButton.swift
//  ChagokChagok
//
//  Created by Youngwoong Choi on 2022/06/13.
//

import SwiftUI

struct FavoriteButtonForCourse: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Course.entity(), sortDescriptors: [],
        animation: .default) private var courses: FetchedResults<Course>

    var course = Course()
    
    var body: some View {
        Button {
            course.isFavorite.toggle()
               
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        } label: {
            Image(systemName: course.isFavorite ? "heart.fill" : "heart")
        }
    }
}

struct FavoriteButtonForCourse_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButtonForPin()
    }
}
