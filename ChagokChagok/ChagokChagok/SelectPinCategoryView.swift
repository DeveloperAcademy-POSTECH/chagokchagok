import SwiftUI

struct SelectPinCategoryView: View {
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [],
        animation: .default) private var pins: FetchedResults<Pin>
    
    var pin = Pin()
    
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
                    updatePinCategory()
                } label: {
                    Text("저장")
                }
            }
        }
    }
    
    private func selectCategoryImage() -> some View {
        LazyVGrid(columns: column, spacing: 10) {
            ForEach(PinCategory.allCases, id: \.rawValue) { value in
                Button(action: {
                    currentCategory = value.rawValue
                }, label: {
                    VStack {
                        Group {
                            if currentCategory == value.rawValue {
                                value.categoryImage
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .overlay(
                                            RoundedRectangle(cornerRadius: 50)
                                                .stroke(.blue, lineWidth: 3)
                                                .padding(10))
                            } else {
                                value.categoryImage
                                    .resizable()
                                    .frame(width: 100, height: 100)
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
            .font(.system(size: 18))
            .foregroundColor(self.currentCategory == value ? .blue : .black)
    }
    
    private func updatePinCategory() {
        withAnimation {
            pin.category = currentCategory

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
