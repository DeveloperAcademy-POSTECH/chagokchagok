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
            VStack {
                NavigationLink(destination: {
                    PinListView()
                }, label: {
                    Text("핀 뷰")
                })
                
                NavigationLink(destination: {
                    CourseListView()
                }, label: {
                    Text("코스 뷰")
                })
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
