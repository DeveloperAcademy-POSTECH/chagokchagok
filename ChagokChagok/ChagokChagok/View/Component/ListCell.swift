import SwiftUI

struct ListCell: View {

    @State var pinImageName: String
    @State var pinName: String
    
    var body: some View {
        HStack {
            Image(pinImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(pinName)
                .foregroundColor(.black)
                .fontWeight(.semibold)
                .font(.footnote)
                .lineLimit(2)
            Spacer()
        }
        .frame(height: 60)
        .background(Color.white.opacity(0.085))
        .cornerRadius(5)

    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(pinImageName: "temp", pinName: "Hello World")
            .previewLayout(.sizeThatFits)
    }
}
