import SwiftUI

struct PinData: Identifiable, Hashable {
    // MARK: Type, category attribute가 없긴한데 일단 임시로 추가 (type 1:pin, 2:course)
    var id: UUID
    var name: String?
    var latitude: Double
    var longitude: Double
    var memo: String?
    var date: String
    var category: String?
    var type: Int = 1
    var isEdited: Bool = false
    var isFavorite: Bool = false
}

extension PinData {
    static func all() -> [PinData] {
        return [
            PinData(id: UUID(), latitude: 32.1234, longitude: 127.1234, date: "2022.12.12"),
            PinData(id: UUID(), name: "영일대가는길에 사진스팟", latitude: 32.1234, longitude: 127.3452, memo: "우와 나중에 여친이랑 와서 사진찍으면 작살날듯", date: "2022.01.21", category: "자연"),
            PinData(id: UUID(), name: "점심특선만원 스시집", latitude: 32.1234, longitude: 127.1234, memo: "회사가는길에 발견. 점심특선 만원인 스시집인데 내일 무조건 간다.", date: "2022.12.12", category: "맛집"),
            PinData(id: UUID(), name: "회사가는길 벚꽃(+20분)", latitude: 32.1234, longitude: 127.1234, memo: "시간은 더걸리는데 이쪽길로 가면 뭔가 여유로운 직장인이 된것 같은 느낌이야. 이 길 너무 좋은데?", date: "2022.12.12", category: "자연")
        ]
    }
}
