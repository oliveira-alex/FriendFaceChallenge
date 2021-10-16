//
//  Friend+CoreDataProperties.swift
//  FriendFaceChallenge
//
//  Created by Alex Oliveira on 15/10/21.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var user: User?

}

extension Friend : Identifiable {

}
