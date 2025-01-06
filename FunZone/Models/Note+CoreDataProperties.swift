//
//  Note+CoreDataProperties.swift
//  FunZone
//
//  Created by admin on 1/4/25.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var noteText: String?
    @NSManaged public var timestamp: Date?

}

extension Note : Identifiable {

}
