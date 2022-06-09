import SwiftUI

struct TempAddDataView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var memo = ""
    @State private var latitude = 0.0
    @State private var longitude = 0.0
    @State private var category = ""
    
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    
    var body: some View {
        Form {
            Section {
                TextField("Pin name", text: $name)
                TextField("추억을 입력하는 memo", text: $memo)
                TextField("카테고리 입력 두개?세개?", text: $category)
                VStack {
                    TextField("Enter latitude", value: $latitude, formatter: formatter)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Enter longitude", value: $longitude, formatter: formatter)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button("Save") {
                        DataController().addPin(name: name, memo: memo, latitude: latitude, longitude: longitude, category: category, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct TempAddDataView_Previews: PreviewProvider {
    static var previews: some View {
        TempAddDataView()
    }
}
