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
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
