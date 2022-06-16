//
//  ChagokChagokApp.swift
//  ChagokChagok
//
//  Created by LeeJiSoo on 2022/06/08.
//

import SwiftUI

@main
struct ChagokChagokApp: App {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                .environmentObject(vm)
        }
    }
}
