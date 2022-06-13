//
//  DateFormat.swift
//  ChagokChagok
//
//  Created by Youngwoong Choi on 2022/06/11.
//

import Foundation

let dateFormat: DateFormatter = {
    let dateFormat = DateFormatter()
    dateFormat.dateFormat = "yyyy.MM.dd"
    return dateFormat
}()
