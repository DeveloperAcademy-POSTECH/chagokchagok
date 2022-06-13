import SwiftUI

struct PinListModal: View {
    
    @Binding var isShowing: Bool
    @State private var isDragging = false
    
    @State private var curHeight: CGFloat = 152
    let minHeight: CGFloat = 151
    let maxHeight: CGFloat = 674
    
    var body: some View {
        VStack {
            VStack(spacing: 0) { // modal
                ZStack { // handle
                    Capsule()
                        .frame(width: 30, height: 4)
                }
                .frame(height: 40) //TODO: Figma 패딩값 적용
                .frame(maxWidth: .infinity)
                // .background(Color.white.opacity(0.00001))
                .gesture(dragGesture)
                
                Text("Total") // TODO: 수량 표시
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20.0)
                ListCell(image: "tempPin", name: "멋진 동산", memo: "저기 진짜 맛있어보인다", createTime: "2022.03.12", type: "핀", isFavorite: true)
                    .padding(.top, 18.0)
                Spacer()
            }
            .ignoresSafeArea()
            .frame(height: curHeight)
            .frame(maxWidth: .infinity)
            .background(.gray)
            .animation(isDragging ? nil : .easeInOut(duration: 0.45))
        }
        .ignoresSafeArea()
    }
    
    @State private var prevDragTranslation = CGSize.zero
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                if !isDragging {
                    isDragging = true
                }
                
                let dragAmount = val.translation.height - prevDragTranslation.height
                if curHeight > maxHeight || curHeight < minHeight {
                    curHeight -= dragAmount/6
                } else {
                    curHeight -= dragAmount
                }
                prevDragTranslation = val.translation
            }
            .onEnded { val in
                prevDragTranslation = .zero
                isDragging = false
                if curHeight > maxHeight {
                    curHeight = maxHeight
                } else if curHeight < minHeight {
                    curHeight = minHeight
                }
            }
    }
}

struct PinListModal_Previews: PreviewProvider {
    static var previews: some View {
        PinListModal(isShowing: .constant(true))
    }
}

//refer https://www.youtube.com/watch?v=I1fsl1wvsjY
