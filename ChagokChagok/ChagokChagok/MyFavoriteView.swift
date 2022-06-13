import SwiftUI

struct MyFavoriteView: View {
    var body: some View {
        VStack {
            myFavoriteList()
        }
    }
    
    private func myFavoriteList() -> some View {
        ScrollView {
            VStack {
                ForEach(PinData.all(), id: \.self) { data in
                    ListCell(data: data)
                        .padding(.vertical, 8)
                    Divider()
                        .frame(width: 329, height: 1, alignment: .center)
                }
                
            }
        }
        .padding(.horizontal, 16)
    }
}

struct MyFavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        MyFavoriteView()
    }
}
