//
//  UserEntity+CoreDataProperties.swift
//  FunZone
//
//  Created by admin on 1/9/25.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var password: String?
    @NSManaged public var username: String?

}

extension UserEntity : Identifiable {

}
