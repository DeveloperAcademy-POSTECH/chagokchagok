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
    @State var textFieldName: String
    @State var textFieldMemo: String
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 80, height: 80, alignment: .leading)
                    
                    Text("풍경") // ToDo: 추후 pin.category로 변경
                        .font(.subheadline)
                        
                }.padding(.trailing)
                
                VStack {
                    HStack {
                        TextField(course.name ?? "임시 제목", text: $textFieldName)
                            .font(.title)
                            .keyboardType(.default)
                            .foregroundColor(.blue)
                            
                        Spacer()
                    }.frame(height: 80)
                    HStack {
                        Text("경상북도 포항항 (좌표->주소)")
                        Text("|")
                            .foregroundColor(.secondary)
                        Text(dateFormat.string(from: course.date ?? Date()))
                        
                        Spacer()
                    }
                    .font(.subheadline)
                    .lineLimit(1)
                }
            }.padding()
   
            TextEditor(text: $textFieldMemo)
                .frame(width: 350, height: 200, alignment: .topLeading)
                .border(.gray, width: 1)
                .cornerRadius(5)
                .foregroundColor(.blue)
            
            Spacer()
        }
        .navigationTitle("편집")
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

//struct CourseEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        CourseEditView()
//    }
//}
