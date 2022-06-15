import SwiftUI

extension Text {
    func listTitleStyle() -> Text {
        bold()
            .font(.system(size: 18))
    }
    
    func listMemoStyle() -> Text {
        font(.system(size: 14))
    }
    
    func recentListTitleStyle() -> Text {
        bold()
            .font(.system(size: 20))
    }
}
