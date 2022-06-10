import SwiftUI

struct ListCell: View {
    var image: String
    var name: String?
    var memo: String?
    var createTime: String
    var type: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 92, height: 92)
            VStack(alignment: .leading) {
                Text(name != nil ? name! : createTime)
                    .bold()
                    .font(.system(size: 16))
                    .font(.footnote)
                    .padding(.bottom, 0.01)
                Text(memo != nil ? "\(memo!)" : "메모를 입력해주세요.")
                    .font(.system(size: 14))
                    .lineLimit(1)
            }
            Spacer()
            VStack {
                Image(systemName: "heart")
                    .frame(width: 20, height: 20, alignment: .topTrailing)
                    .padding(.top, 5)
                Spacer()
            }
        }
        .frame(width: 350, height: 92)
        .background(Color.white.opacity(0.085))
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(image: "tempPin", name: "멋진 동산", memo: "저기 진짜 맛있어보인다", createTime: "2022.03.12", type: "핀")
            .previewLayout(.sizeThatFits)
    }
}
