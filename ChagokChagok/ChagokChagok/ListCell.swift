import SwiftUI

struct ListCell: View {
    var image: String
    var name: String?
    var memo: String?
    var createTime: String
    var type: String
    var isFavorite: Bool
    
    var body: some View {
        HStack {
            Image(image)
                .listIconStyle()
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image("tempTypeImage")
                        .resizable()
                        .frame(width: 13, height: 10, alignment: .leading)
                    Text(type)
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                }
                .frame(width: 40, height: 20)
                Text(name != nil ? name! : createTime)
                    .listTitleStyle()
                    .padding(.bottom, 5)
                Text(memo != nil ? "\(memo!)" : "메모를 입력해주세요.")
                    .listMemoStyle()
                    .lineLimit(1)
            }
            Spacer()
            VStack {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .frame(width: 20, height: 20, alignment: .topTrailing)
                    .padding(.top, 5)
//                    .onTapGesture {
//                        isFavorite.toggle()
//                    }
                Spacer()
            }
        }
        .frame(width: 350, height: 92)
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(image: "tempPin", name: "멋진 동산", memo: "저기 진짜 맛있어보인다", createTime: "2022.03.12", type: "핀", isFavorite: true)
            .previewLayout(.sizeThatFits)
    }
}
