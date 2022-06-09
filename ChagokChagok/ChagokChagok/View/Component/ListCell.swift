import SwiftUI

struct ListCell: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    @FetchRequest(sortDescriptors: [SortDescriptor(\.createTime, order: .reverse)]) var pin: FetchedResults<Pin>
    @State private var name = ""
    
    @State private var latitude = 0.0
    @State private var longitude = 0.0
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell()
    }
}
