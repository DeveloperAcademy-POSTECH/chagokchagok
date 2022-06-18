import SwiftUI

struct ListCell: View {
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Pin.date, ascending: false)],
        animation: .default) private var pins: FetchedResults<Pin>
    
    var pin = Pin()
        
    var body: some View {

        HStack {
            listImage
                .padding(.trailing, 16)
            listText
            Spacer()
            isfavoriteBtn
        }
        .frame(width: 350, height: 92)
    }
    
    var listImage: some View {
        Image(pin.category ?? "핀")
            .listIconStyle()
    }
    
    var listText: some View {
        VStack(alignment: .leading, spacing: 7) {
            HStack {
                Image("pinIcon")
                    .resizable()
                    .frame(width: 13, height: 17)
                    .padding(.bottom, 4)
//                Text(data.type == 1 ? "tempTypeImage" : "tmepTypeImage")
//                    .foregroundColor(.gray)
//                    .font(.system(size: 12))
                Text(pin.name ?? dateFormat.string(from: pin.date!))
                    .listTitleStyle()
                    .listTextSpaceStyle()
            }
            .frame(width: 208, height: 22, alignment: .leading)
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
        }
    }
    
}
