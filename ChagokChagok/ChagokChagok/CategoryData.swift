import SwiftUI

extension Image {
    static let cityImage: Image = Image("tempCategoryimage")
    static let beachImgae: Image = Image("tempCategoryimage")
    static let mountainImage: Image = Image("tempCategoryimage")
    static let riverImage: Image = Image("tempCategoryimage")
    static let sceneryImgae: Image = Image("tempCategoryimage")
    static let nightscapeImage: Image = Image("tempCategoryimage")
    static let withfriendImage: Image = Image("tempCategoryimage")
    static let walkroadImage: Image = Image("tempCategoryimage")
}

enum CourseCategory: String, CaseIterable, Hashable {
    case city = "도심"
    case beach = "바닷가"
    case mountain = "산"
    case river = "강가"
    case scenery = "풍경"
    case nightscape = "야경"
    case withfriend = "친구랑"
    case walkroad = "산책로"
}

extension CourseCategory {
    var categoryImage: Image {
        switch self {
        case .city:
            return Image.cityImage
        case .beach:
            return Image.beachImgae
        case .mountain:
            return Image.mountainImage
        case .river:
            return Image.riverImage
        case .scenery:
            return Image.sceneryImgae
        case .nightscape:
            return Image.nightscapeImage
        case .withfriend:
            return Image.withfriendImage
        case .walkroad:
            return Image.walkroadImage
        }
    }
}
