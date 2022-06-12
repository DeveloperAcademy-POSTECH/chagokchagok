//
//  Persistence.swift
//  ChagokChagok
//
//  Created by Youngwoong Choi on 2022/06/10.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for xxx in 0..<2 {
            let newPin = Pin(context: viewContext)
            newPin.name = String("\(xxx)")
            newPin.id = UUID()
            newPin.memo = "프리뷰 확인을 위해 일단 아무 내용이나 써서 init합니다"
            newPin.date = Date()
            newPin.longitude = 39.000
            newPin.latitude = 120.000
            newPin.isFavorite = false
            newPin.isEdited = false
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "CoreData")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
