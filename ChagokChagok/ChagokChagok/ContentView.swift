//
//  ContentView.swift
//  ChagokChagok
//
//  Created by LeeJiSoo on 2022/06/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ListCell(image: "tempPin", name: "멋진 동산", memo: "저기 진짜 맛있어보인다", createTime: "2022.03.12", type: "핀", isFavorite: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
