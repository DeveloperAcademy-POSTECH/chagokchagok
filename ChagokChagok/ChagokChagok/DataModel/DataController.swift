import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "DataModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    // saved data
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!")
        } catch {
            print("We could not save the data...")
        }
    }
    
    func addPin(name: String, memo: String, latitude: Double, longitude: Double, category: String, context: NSManagedObjectContext) {
        let pin = Pin(context: context)
        pin.id = UUID()
        pin.createTime = Date()
        pin.name = name
        pin.memo = memo
        pin.latitude = latitude
        pin.longitude = longitude
        pin.category = category
        
        save(context: context)
    }
    
    func editPin(pin: Pin, name: String, memo: String, latitude: Double, longitude: Double, category: String, context: NSManagedObjectContext) {
//        pin.createTime = Date()  // 날짜는 수정 안함
        pin.name = name
        pin.memo = memo
        pin.longitude = longitude
        pin.latitude = latitude
        pin.category = category
        
        save(context: context)
    }
}
