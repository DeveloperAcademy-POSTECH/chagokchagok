//
//  ContentView.swift
//  ChagokChagok
//
//  Created by LeeJiSoo on 2022/06/08.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationView {
            ZStack{
                Color.backGround.ignoresSafeArea()
                MainView()
                    .padding(.top, 47)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("차곡차곡 🚙")
                                .padding(EdgeInsets(top: 80, leading: 16, bottom: 16, trailing: 16))
                                .font(.system(size: 26).weight(.semibold))
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .padding(.all, 16)
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
