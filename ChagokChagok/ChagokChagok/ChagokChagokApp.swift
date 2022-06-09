//
//  ChagokChagokApp.swift
//  ChagokChagok
//
//  Created by LeeJiSoo on 2022/06/08.
//

import SwiftUI

@main
struct ChagokChagokApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
