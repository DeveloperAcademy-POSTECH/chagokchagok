import SwiftUI

extension Image {
    func listIconStyle() -> some View {
        self
            .resizable()
            .frame(width: 70, height: 70)
    }
    
    func recentListIconStyle() -> some View {
        self
            .resizable()
            .frame(width: 50, height: 50)
    }
}
