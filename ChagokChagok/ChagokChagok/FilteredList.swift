import SwiftUI

struct FilteredList: View {
    var contentsList = PinData.all()
    @Binding var selectedCategory: [String]
    
    var body: some View {
        // TODO: ListCell 받아와서 넣기
//        ForEach(self.contentsList, id: .\name) {content in
//            if selected.contains(content.category ?? "nil") {
//
//            }
//        }
        
        if selectedCategory.isEmpty {
            List(contentsList, id: \.name) {pin in
                GroupBox(label: Text(pin.name ?? "defaultName"), content: {
                    Text("Dtesting")
                        .frame(width: 100, height: 100)
                        .background(.blue)
                })
            }
        } else {
            List(contentsList, id: \.name) { pin in
                if selectedCategory.contains(pin.category ?? "nil") {
                    GroupBox(label: Text(pin.name ?? "defaultName"), content: {
                        Text("testing")
                            .frame(width: 100, height: 100)
                            .background(.blue)
                    })
                }
            }
        }
    }
}
