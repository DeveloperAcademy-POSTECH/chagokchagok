//
//  CategoryData.swift
//  ChagokChagok
//
//  Created by LeeJiSoo on 2022/06/15.
//

import SwiftUI
extension Image {
    static let cityImage: Image = Image("cityImage")
    static let beachImgae: Image = Image("beachImage")
    static let riverImage: Image = Image("riverImage")
    static let nightscapeImage: Image = Image("nightscapeImage")
    static let cafeImage: Image = Image("cafeImage")
    static let restaurantImage: Image = Image("restaurantImage")
    static let natureImage: Image = Image("natureImage")
    static let photospotImage: Image = Image("photospotImage")
    static let flowerImage: Image = Image("flowerImage")
    static let islandImage: Image = Image("islandImage")
    static let tourspotImage: Image = Image("tourspotImage")
    static let sunsetImage: Image = Image("sunsetImage")
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
