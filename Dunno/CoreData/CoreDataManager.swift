//
//  CoreDataManager.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    var userData: UserData = .shared
    
    private init(){}
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Dunno")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    private var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func loadDataFromContainer<T: NSManagedObject>(ofType type: T.Type) -> [T] {
        var data = [T]()

        let entityName = NSStringFromClass(type)
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)

        do {
            data = try context.fetch(fetchRequest)
        } catch {
            print("Error loading Data from Container")
        }
        return data
    }
    
    func saveTest(title: String, code: String, fromDate: Date?, toDate: Date?) -> Test? {
        guard let entity = NSEntityDescription.entity(forEntityName: "Test", in: context) else { return nil}
        let test = NSManagedObject(entity: entity, insertInto: context) as! Test
        
        test.title = title
        test.activeFrom = fromDate
        test.activeTo = toDate
        test.code = code
        saveContext()
        userData.tests.append(test)
        return test
    }
    
    func updateTestWith(id: Int, test: Test) {
        test.testId = String(id)
        saveContext()
    }
    
//    func saveMessage(direction: Direction, message: String, colocutor: String, date: Date?) -> SavedMessage? {
//        guard let entity = NSEntityDescription.entity(forEntityName: "SavedMessage", in: context) else { return nil }
//        let coreDataMessage = NSManagedObject(entity: entity, insertInto: context) as! SavedMessage
//        coreDataMessage.body = message
//        coreDataMessage.colocutor = colocutor
//        coreDataMessage.setDirection(direction)
//        coreDataMessage.date = date
//        saveContext()
//
//        userData.messages.append(coreDataMessage)
//        return coreDataMessage
//    }
    
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving context")
            }
        }
    }
}


