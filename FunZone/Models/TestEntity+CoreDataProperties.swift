//
//  TestEntity+CoreDataProperties.swift
//  FunZone
//
//  Created by admin on 1/4/25.
//
//

import Foundation
import CoreData


extension TestEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TestEntity> {
        return NSFetchRequest<TestEntity>(entityName: "TestEntity")
    }

    @NSManaged public var testAttr: String?

}

extension TestEntity : Identifiable {

}
