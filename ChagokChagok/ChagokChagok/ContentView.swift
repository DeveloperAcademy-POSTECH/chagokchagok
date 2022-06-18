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
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backGround.ignoresSafeArea()
                VStack(alignment: .leading, spacing: 0) {
                    Text("차곡차곡")
                        .font(.title)
                        .bold()
                        .padding(.leading, 16)
                    MainView(firstNaviLinkActive: $firstNaviLinkActive)
                }
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
