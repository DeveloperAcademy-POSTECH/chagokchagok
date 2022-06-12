//
//  ChagokChagokApp.swift
//  ChagokChagok
//
//  Created by LeeJiSoo on 2022/06/08.
//

import SwiftUI

@main
struct ChagokChagokApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            PinListView()
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
