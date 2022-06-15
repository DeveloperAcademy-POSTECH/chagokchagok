import SwiftUI

struct FilteredList: View {
    var contentsList = PinData.all()
    @Binding var selected: [String]
    
    var body: some View {
        /* TODO: ListCell 받아와서 넣기
        ForEach(self.contentsList, id: .\name) {content in
            if selected.contains(content.category ?? "nil") {
                
            }
        }
        */
        if selected.isEmpty {
            List(self.contentsList, id: \.name) {content in
                GroupBox(label: Text(content.name ?? "defaultName"), content: {
                    Text("Dtesting")
                        .frame(width: 100, height: 100)
                        .background(.blue)
                })
            }
        } else {
            List(self.contentsList, id: \.name) { content in
                if selected.contains(content.category ?? "nil") {
                    GroupBox(label: Text(content.name ?? "defaultName"), content: {
                        Text("testing")
                            .frame(width: 100, height: 100)
                            .background(.blue)
                    })
                }
            }
        }
    }
}
