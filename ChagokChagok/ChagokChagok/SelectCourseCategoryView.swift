import SwiftUI

struct SelectCourseCategoryView: View {
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Course.entity(), sortDescriptors: [],
        animation: .default) private var courses: FetchedResults<Course>
    
    var course = Course()

    // TODO: 해당 pin/course 가 어떤 카테고린지 받아와야함
    @State var currentCategory: String
    
    let column = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        VStack {
            selectCategoryImage()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    updateCourseCategory()
                } label: {
                    Text("저장")
                }
            }
        }
    }
    
    private func selectCategoryImage() -> some View {
        LazyVGrid(columns: column, spacing: 10) {
            ForEach(CourseCategory.allCases, id: \.rawValue) { value in
                Button(action: {
                    currentCategory = value.rawValue
                    // action
                }, label: {
                    VStack {
                        Group {
                            if currentCategory == value.rawValue {
                                ZStack {
                                    value.categoryImage
                                        .resizable()
                                        .frame(width: 94, height: 94)
                                    Image("selected")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                }
                            } else {
                                value.categoryImage
                                    .resizable()
                                    .frame(width: 94, height: 94)
                            }
                            selectCategoryText(value: value.rawValue)
                        }
                    }
                })
                .padding(.bottom, 42)
            }
        }
        .padding(24)
    }
    
    private func selectCategoryText(value: String) -> some View {
        Text(value)
            .font(.system(size: 18, weight: self.currentCategory == value ? .bold : .regular))
            .foregroundColor(self.currentCategory == value ? .mainBlue : .baseBlack)
    }
    
    private func updateCourseCategory() {
        withAnimation {
            course.category = currentCategory

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            self.presentation.wrappedValue.dismiss()
        }
    }
}

//struct SelectCourseCategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectCourseCategoryView()
//    }
//}
