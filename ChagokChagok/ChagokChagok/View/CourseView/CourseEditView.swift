//
//  CourseEditView.swift
//  ChagokChagok
//
//  Created by Youngwoong Choi on 2022/06/14.
//

import SwiftUI

struct CourseEditView: View {
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) private var viewContext
    
    var course = Course()
    
    @State var textFieldName: String = "제목"
    @State var textFieldMemo: String = "메모"
    @State var placeholder: String = "입력하세요"
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Image(course.category ?? "코스")
                        .resizable()
                        .frame(width: 76, height: 76, alignment: .center)
                    
                    NavigationLink(destination: {
                        SelectCourseCategoryView(course: course, currentCategory: course.category ?? "")
                    }, label: {
                        Circle()
                            .foregroundColor(.blue)
                            .frame(width: 76, height: 76)
                            .opacity(0.5)
                    })
 
                    Text("변경")
                        .foregroundColor(.white)
                        .frame(width: 76, height: 76, alignment: .center)
                }
                
                VStack(spacing: 2) {
                    Text("")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    
                    TextField(course.name ?? "", text: $textFieldName)
                        .font(.system(size: 22))
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .frame(width: 250)
                    
                    Divider()
                    
                }
                .padding(.leading, 24)
            }
            .frame(width: 350, height: 80, alignment: .leading)
            .padding(.top, 45)
            
            ZStack(alignment: .topLeading, content: {
                if textFieldMemo.isEmpty {
                    TextEditor(text: $placeholder)
                        .font(.system(size: 15))
                        .frame(width: 350, height: 200, alignment: .topLeading)
                }
                TextEditor(text: $textFieldMemo)
                    .font(.system(size: 15))
                    .frame(width: 350, height: 200, alignment: .topLeading)
                    .opacity(textFieldMemo.isEmpty ? 0.2 : 1)
            })
            
            Spacer()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    updateCourse(textFieldName: textFieldName, textFieldMemo: textFieldMemo)
                } label: {
                    Text("저장")
                }
            }
        }
    }
    
    private func updateCourse(textFieldName: String, textFieldMemo: String) {
        withAnimation {
            course.name = textFieldName
            course.memo = textFieldMemo
            course.isEdited = true
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            self.presentation.wrappedValue.dismiss()
        }
        return()
    }
    
}

// struct CourseEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        CourseEditView()
//    }
// }
