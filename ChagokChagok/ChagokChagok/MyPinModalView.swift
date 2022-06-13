import SwiftUI

struct MyPinModalView: View {
    
    @State private var showModal = false
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                CategoryScroll()
                    .padding(.leading, 20.0)
                    .padding(.bottom, 17.0)
                    .frame(width: 390, height: 170, alignment: .bottomLeading)
                    .background(.black)
                Spacer()
                PinListModal(isShowing: $showModal)
                
            }
            .ignoresSafeArea()

        }
        .ignoresSafeArea()
    }
}

struct MyPinModalView_Previews: PreviewProvider {
    static var previews: some View {
        MyPinModalView()
    }
}
