//
//  User+CoreDataProperties.swift
//  FriendFaceChallenge
//
//  Created by Alex Oliveira on 15/10/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: String?
    @NSManaged public var tags: [String]?
    @NSManaged public var friends: NSSet?

    var lastName: String {
        let nameArray = (name ?? "").components(separatedBy: " ")
        switch nameArray.count {
        case 0:
            return "Unknown"
        case 1:
            return ""
        default:
            return nameArray.last!
        }
    }
    
    var friendsArray: [Friend] {
        if let friendsSet = friends as? Set<Friend> {
            return friendsSet.sorted { ($0.name ?? "") < ($1.name ?? "") }
        }
        
        return []
    }
}

// MARK: Generated accessors for friends
extension User {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: Friend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: Friend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension User : Identifiable {

}
