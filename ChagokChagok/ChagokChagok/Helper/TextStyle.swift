import SwiftUI

extension Text {
    func listTitleStyle() -> Text {
        bold()
            .font(.system(size: 18))
            .foregroundColor(.baseBlack)
    }
    
    func listMemoStyle() -> Text {
        font(.system(size: 14))
            .foregroundColor(.baseBlack.opacity(0.7))
    }
    
    func recentListTitleStyle() -> Text {
        bold()
            .font(.system(size: 20))
            .foregroundColor(.baseBlack)
    }
}
