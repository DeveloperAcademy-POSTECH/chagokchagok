//
//  ContentView.swift
//  ChagokChagok
//
//  Created by LeeJiSoo on 2022/06/08.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var firstNaviLinkActive = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "AppleSDGothicNeo-Bold", size: 26)!]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backGround.ignoresSafeArea()
                MainView(firstNaviLinkActive: $firstNaviLinkActive)
                    .navigationBarTitle("차곡차곡")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
