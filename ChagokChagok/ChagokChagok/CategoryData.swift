//
//  CategoryData.swift
//  ChagokChagok
//
//  Created by LeeJiSoo on 2022/06/15.
//

import SwiftUI
extension Image {
    static let cityImage: Image = Image("도심")
    static let beachImgae: Image = Image("바닷가")
    static let riverImage: Image = Image("강가")
    static let nightscapeImage: Image = Image("야경")
    static let cafeImage: Image = Image("카페")
    static let restaurantImage: Image = Image("맛집")
    static let natureImage: Image = Image("자연")
    static let photospotImage: Image = Image("사진스팟")
    static let flowerImage: Image = Image("꽃길")
    static let islandImage: Image = Image("섬")
    static let tourspotImage: Image = Image("관광지")
    static let sunsetImage: Image = Image("노을")
}

enum CourseCategory: String, CaseIterable, Hashable {
    case beach = "바닷가"
    case city = "도심"
    case flower = "꽃길"
    case nature = "자연"
    case nightscape = "야경"
    case river = "강가"
}

enum PinCategory: String, CaseIterable, Hashable {
    case cafe = "카페"
    case island = "섬"
    case restaurant = "맛집"
    case tourspot = "관광지"
    case photospot = "사진스팟"
    case sunset = "노을"
}

extension CourseCategory {
    var categoryImage: Image {
        switch self {
        case .city:
            return Image.cityImage
        case .beach:
            return Image.beachImgae
        case .flower:
            return Image.flowerImage
        case .nature:
            return Image.natureImage
        case .nightscape:
            return Image.nightscapeImage
        case .river:
            return Image.riverImage
        }
    }
}

extension PinCategory {
    var categoryImage: Image {
        switch self {
        case .cafe:
            return Image.cafeImage
        case .island:
            return Image.islandImage
        case .restaurant:
            return Image.restaurantImage
        case .tourspot:
            return Image.tourspotImage
        case .photospot:
            return Image.photospotImage
        case .sunset:
            return Image.sunsetImage
        }
    }
}
