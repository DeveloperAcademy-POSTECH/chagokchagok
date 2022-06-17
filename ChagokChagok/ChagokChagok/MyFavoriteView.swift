import SwiftUI

struct MyFavoriteView: View {
    
    
    var body: some View {
        VStack {
            myFavoriteCount()
            myFavoriteList()
        }
    }
    
    private func myFavoriteList() -> some View {
        ScrollView {
            VStack {
                ForEach(PinData.all(), id: \.self) { data in
                    ListCell()
                        .padding(.vertical, 8)
                    Divider()
                        .frame(width: 329, height: 1, alignment: .center)
                }
                
            }
        }
        .padding(.horizontal, 16)
    }
    
    private func myFavoriteCount() -> some View {
        Text("Total \(PinData.all().count)")
            .font(.system(size: 14))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
    }
}

struct MyFavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        MyFavoriteView()
    }
}
