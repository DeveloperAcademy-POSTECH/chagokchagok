import SwiftUI

struct ListCell: View {
    @State var data: PinData
    
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
        Image(data.category ?? "tempCategoryimage")
            .listIconStyle()
    }
    
    var listText: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image("tempTypeImage")
                    .resizable()
                    .frame(width: 13, height: 10, alignment: .leading)
                Text(data.type == 1 ? "tempTypeImage" : "tmepTypeImage")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
            }
            .frame(width: 40, height: 20)
            Text(data.name != nil ? data.name! : data.date)
                .listTitleStyle()
                .listTextSpaceStyle()
            Text(data.memo != nil ? "\(data.memo!)" : "메모를 입력해주세요.")
                .listMemoStyle()
                .listMemoSpaceStyle()
        }
    }
    
    var isfavoriteBtn: some View {
        VStack {
            Image(systemName: data.isFavorite ? "heart.fill" : "heart")
                .frame(width: 20, height: 20, alignment: .topTrailing)
                .padding(.top, 5)
            Spacer()
        }
    }
    
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(data: PinData.all().first!)
            .previewLayout(.sizeThatFits)
    }
}
