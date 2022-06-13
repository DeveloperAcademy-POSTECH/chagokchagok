//
//  ContentView.swift
//  ChagokChagok
//
//  Created by LeeJiSoo on 2022/06/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MainView()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("차곡차곡 🚙")
                            .padding(.all, 16)
                            .font(.system(size: 26).weight(.semibold))
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .padding(.all, 16)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
