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
/*
struct FilteredList_Previews: PreviewProvider {
    static var previews: some View {
        FilteredList()
    }
}
*/
