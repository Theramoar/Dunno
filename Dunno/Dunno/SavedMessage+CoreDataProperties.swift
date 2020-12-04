//
//  SavedMessage+CoreDataProperties.swift
//  Dunno
//
//  Created by Misha Kuznecov on 04/12/2020.
//
//

import Foundation
import CoreData


extension SavedMessage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedMessage> {
        return NSFetchRequest<SavedMessage>(entityName: "SavedMessage")
    }

    @NSManaged public var body: String?
    @NSManaged public var colocutor: String?
    @NSManaged public var date: Date?
    @NSManaged public var direction: Bool
    
    
    func setDirection(_ direction: Direction) {
        switch direction {
        case .inbound:
            self.direction = false
        case .outbound:
            self.direction = true
        }
    }
    
    func getDirection() -> Direction {
        if self.direction == true {
            return .outbound
        } else {
            return .inbound
        }
    }
    
    func getTime() -> String {
        guard let date = date else {
            return "N/A"
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }

}

extension SavedMessage : Identifiable {

}
