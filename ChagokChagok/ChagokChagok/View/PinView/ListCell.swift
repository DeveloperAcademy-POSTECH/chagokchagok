import SwiftUI

struct ListCell: View {
    @FetchRequest(entity: Pin.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Pin.date, ascending: false)],
        animation: .default) private var pins: FetchedResults<Pin>
    
    var pin = Pin()
    
    var body: some View {
        HStack {
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 76, height: 76)
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
                Text(pin.name ?? "제목이 없어요")
                    .bold()
                    .font(.system(size: 18))
                    .padding(.bottom, 5)
                Text(pin.memo ?? "내용이 없어요")
                    .font(.system(size: 14))
                    .lineLimit(1)
            }
            Spacer()
            VStack {
                FavoriteButtonForPin(pin: pin)

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
//        ListCell(pin: pin)
//            .previewLayout(.sizeThatFits)
//    }
//}
