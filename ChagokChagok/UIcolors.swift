//
//  UIcolors.swift
//  ChagokChagok
//
//  Created by 윤가희 on 2022/06/14.
//
import SwiftUI

extension Color {
    static let baseBlack = Color(hex: "#1D1D1D")
    static let mainBlue = Color(hex: "#466FFF")
    static let tagGray = Color(hex: "E7E7E7")
    static let iconBlue = Color(hex: "#7090FF")
    static let iconPink = Color(hex: "#FFA0A0")
    static let iconBack = Color(hex: "#EFF2FF")
    static let backGround = Color(hex: "#EEEEEE")

    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let rgbRed = Double((rgb >> 16) & 0xFF) / 255.0
        let rgbGreen = Double((rgb >> 8) & 0xFF) / 255.0
        let rgbBlue = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red: rgbRed, green: rgbGreen, blue: rgbBlue)
    }
}
