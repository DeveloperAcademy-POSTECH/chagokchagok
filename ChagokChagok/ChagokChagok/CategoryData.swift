//
//  CategoryData.swift
//  ChagokChagok
//
//  Created by LeeJiSoo on 2022/06/15.
//

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
    static let cafeImage: Image = Image("tempCategoryimage")
    static let restaurantImage: Image = Image("tempCategoryimage")
    static let natureImage: Image = Image("tempCategoryimage")
    static let photospotImage: Image = Image("tempCategoryimage")
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

enum PinCategory: String, CaseIterable, Hashable {
    case cafe = "카페"
    case restaurant = "맛집"
    case nature = "자연"
    case photospot = "사진스팟"
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

extension PinCategory {
    var categoryImage: Image {
        switch self {
        case .cafe:
            return Image.cafeImage
        case .restaurant:
            return Image.restaurantImage
        case .nature:
            return Image.natureImage
        case .photospot:
            return Image.photospotImage
        }
    }
}
