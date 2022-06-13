import SwiftUI

extension View {
    func listTextSpaceStyle() -> some View {
        padding(.bottom, 5)
    }
    
    func listMemoSpaceStyle() -> some View {
        lineLimit(1)
            .padding(.bottom, 5)
    }
    
    func recentListViewStyle() -> some View {
        frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 16, leading: 18, bottom: 18, trailing: 18))
    }
}
