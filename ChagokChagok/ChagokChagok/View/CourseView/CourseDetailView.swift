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
                VStack {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 76, height: 76, alignment: .leading)
                }.padding(.trailing)

                VStack {
                    VStack {
                        Text(dateFormat.string(from: course.date ?? Date()))
                            .font(.system(size: 15))

                        Text(course.name ?? "")
                            .font(.title)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        
                        Spacer()
                    }.frame(height: 80)
                    
                    HStack {
                        Text("경상북도 포항항 (좌표->주소)")
                        Text("|")
                            .foregroundColor(.secondary)
                        Text(dateFormat.string(from: course.date ?? Date()))
                        
                        Spacer()
                    }
                    .font(.caption)
                    .lineLimit(1)
                }
            }
            .padding()
            
            Rectangle() // 지도 들어갈 자리
                .frame(height: 300)
                .padding(.horizontal)
            
            Text(course.memo ?? "내용 없음")
                .frame(width: 360, height: 100, alignment: .topLeading)
            Spacer()

        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Image(systemName: "mappin.circle.fill")
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
