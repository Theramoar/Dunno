//
//  Test+CoreDataProperties.swift
//  Dunno
//
//  Created by Misha Kuznecov on 18/02/2021.
//
//

import Foundation
import CoreData


extension Test {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Test> {
        return NSFetchRequest<Test>(entityName: "Test")
    }

    @NSManaged public var title: String?
    @NSManaged public var code: String?
    @NSManaged public var activeFrom: Date?
    @NSManaged public var activeTo: Date?
    @NSManaged public var testId: String?

}

extension Test : Identifiable {

}
