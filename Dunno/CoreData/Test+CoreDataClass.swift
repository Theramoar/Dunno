//
//  Test+CoreDataClass.swift
//  Dunno
//
//  Created by Misha Kuznecov on 18/02/2021.
//
//

import Foundation
import CoreData

@objc(Test)
public class Test: NSManagedObject {
    enum DateType {
        case activeTo
        case activeFrom
    }
    func getStringFromDate(_ type: DateType) -> String {
        var testDate: Date?
        switch type {
        case .activeTo:
            testDate = activeTo
        case .activeFrom:
            testDate = activeFrom
        }
        
        guard let date = testDate else {
            return "N/A"
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date)
    }
}
