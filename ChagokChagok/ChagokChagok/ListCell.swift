import SwiftUI

struct ListCell: View {
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Pin.date, ascending: false)],
        animation: .default) private var pins: FetchedResults<Pin>
    
    var pin = Pin()
        
    var body: some View {

        HStack {
            listImage
            listText
            Spacer()
            isfavoriteBtn
        }
        .frame(width: 350, height: 92)
    }
    
    var listImage: some View {
        Image(pin.category ?? "tempCategoryimage")
            .listIconStyle()
    }
    
    var listText: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image("tempTypeImage")
                    .resizable()
                    .frame(width: 13, height: 10, alignment: .leading)
//                Text(data.type == 1 ? "tempTypeImage" : "tmepTypeImage")
//                    .foregroundColor(.gray)
//                    .font(.system(size: 12))
            }
            .frame(width: 40, height: 20)
            Text(pin.name ?? dateFormat.string(from: pin.date!))
                .listTitleStyle()
                .listTextSpaceStyle()
            Text(pin.memo ?? "메모를 입력바랍니다아")
                .listMemoStyle()
                .listMemoSpaceStyle()
        }
    }
    
    var isfavoriteBtn: some View {
        VStack {
            Image(systemName: pin.isFavorite ? "heart.fill" : "heart")
                .frame(width: 20, height: 20, alignment: .topTrailing)
                .padding(.top, 5)
            Spacer()
        }
    }
    
}
