import SwiftUI

struct ListCell: View {
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Pin.date, ascending: false)],
        animation: .default) private var pins: FetchedResults<Pin>
    
    var pin = Pin()
    
    var body: some View {
        HStack {
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 92, height: 92)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image("tempTypeImage")
                        .resizable()
                        .frame(width: 13, height: 10, alignment: .leading)
                    Text("코스")
                        .foregroundColor(.gray)
                        .font(.system(size: 10))
                }
                .frame(width: 40, height: 20)
                Text(pin.name ?? "임시 제목")
                    .bold()
                    .font(.system(size: 18))
                    .padding(.bottom, 5)
                Text(pin.memo ?? "메모를 입력해주세요.")
                    .font(.system(size: 14))
                    .lineLimit(1)
            }
            Spacer()
            VStack {
                FavoriteButton(pin: pin)
//                Image(systemName: isFavorite ? "heart.fill" : "heart")
//                    .frame(width: 20, height: 20, alignment: .topTrailing)
//                    .padding(.top, 5)
//                    .onTapGesture {
//                        isFavorite.toggle()
//                    }
                Spacer()
            }
        }
        .frame(width: 350, height: 92)
    }
}

//struct ListCell_Previews: PreviewProvider {
//    static var previews: some View {
//        var pin = Pin()
//
//        ListCell(image: "tempPin", name: pin.name, memo: "저기 진짜 맛있어보인다", type: "핀", isFavorite: true)
//            .previewLayout(.sizeThatFits)
//    }
//}
