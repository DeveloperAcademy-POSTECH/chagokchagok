//
//  CourseDetailView.swift
//  ChagokChagok
//
//  Created by Youngwoong Choi on 2022/06/14.
//

import SwiftUI

struct CourseDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Course.entity(), sortDescriptors: [],
        animation: .default) private var courses: FetchedResults<Course>
       
    var course = Course()
    
    var body: some View {
        VStack {
            HStack {
                Image(course.category ?? "코스")
                    .resizable()
                    .frame(width: 76, height: 76, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(dateFormat.string(from: course.date ?? Date()))
                        .font(.system(size: 15))
                        .foregroundColor(.gray)

                    Text(course.name ?? "제목을 써주세요")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }
                .padding(.leading, 24)
                
                Spacer()
            }
            .frame(width: 350, height: 80, alignment: .leading)
            .padding(.top, 45)
            
//            Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: pin.latitude, longitude: pin.longitude),
//        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), interactionModes: .all, showsUserLocation: true, annotationItems: pins, annotationContent: { pin in
//                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: pin.latitude, longitude: pin.longitude)) {
//                    Image(systemName: "mappin")
//                        .foregroundColor(.pink)
//                }
//            })
//                .frame(width: 350, height: 350)
//                .cornerRadius(14)
//                .padding(22)
            
            Text(course.memo ?? "내용 없음")
                .font(.system(size: 15))
                .frame(width: 350, height: 100, alignment: .topLeading)
            
            Spacer()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Image("courseIcon")
                        .resizable()
                        .frame(width: 20, height: 15)
                    Text("코스")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    FavoriteButtonForCourse(course: course)
                    
                    NavigationLink {
                        CourseEditView(course: course, textFieldName: course.name ?? "", textFieldMemo: course.memo ?? "")
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView()
    }
}
