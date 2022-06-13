import SwiftUI

struct RecentRecordCell: View {
    var image: String
    var name: String?
    var memo: String?
    var createTime: String
    var type: String
    var isFavorite: Bool
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 0) {
                // TODO: 핀1,2,,, index
                Text("\(createTime) \(type)")
                    .listTitleStyle()
                    .padding(.bottom, 8)
                Text(memo != nil ? "\(memo!)" : "메모를 입력해주세요.")
                    .listMemoStyle()
                    .lineLimit(1)
            }
            Spacer()
        }
        .padding(.horizontal, 18)
        .frame(width: 350, height: 50)
    }
}

struct RecentRecordCell_Previews: PreviewProvider {
    static var previews: some View {
        RecentRecordCell(image: "tempPin", name: "이름 미정", memo: "메모를 수정해라아아악", createTime: "2022.03.12", type: "핀", isFavorite: true)
            .previewLayout(.sizeThatFits)
    }
}
