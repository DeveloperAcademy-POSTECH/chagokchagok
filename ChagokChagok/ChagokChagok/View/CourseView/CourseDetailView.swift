//
//  CourseDetailView.swift
//  ChagokChagok
//
//  Created by Youngwoong Choi on 2022/06/14.
//

import MapKit
import SwiftUI

struct CourseDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var locationManager = LocationManager()
    
    @FetchRequest(entity: Course.entity(), sortDescriptors: [],
        animation: .default) private var courses: FetchedResults<Course>
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [],
        animation: .default) private var pins: FetchedResults<Pin>
    
    // MARK: 임시로 pin 데이터를 넣어줌 (지도넣을라고)
    var pin = Pin()
    var course = Course()

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 22) {
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
                    }
                        .padding(.leading, 24)
                }
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 17.5))
                    .frame(width: geo.size.width, alignment: .leading)

                Map(coordinateRegion: $locationManager.mapRegion,
                    showsUserLocation: true,
                    annotationItems: pins,
                    annotationContent: { pin in MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: 36.0189315, longitude: 129.3429384)) {
                            LocationMapAnnotationView()
                                .scaleEffect(pin == pin ? 1.1 : 0.8)
                                .shadow(radius: 10)
                                .onTapGesture {
//                            viewModel.showNextLocation(location: pin)
                            }
                        }
                    })
                    .frame(width: geo.size.width * 0.9, height: geo.size.width * 0.95)
                    .cornerRadius(14)

                Text(course.memo ?? "내용 없음")
                    .font(.system(size: 15))
                    .padding(.horizontal, 20)
                    .frame(width: geo.size.width, alignment: .leading)
            }
                .frame(width: geo.size.width, height: geo.size.height * 0.9, alignment: .top)
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
