//
//  Structs.swift
//  FriendFaceChallenge
//
//  Created by Alex Oliveira on 11/10/21.
//

import Foundation

struct User: Codable {
    let id, name, company, email, address, about, registered: String
    let isActive: Bool
    let age: Int
    let tags: [String]
    let friends: [Friend]
    
    var lastName: String {
        let nameArray = name.components(separatedBy: " ")
        switch name.count {
        case 0:
            return "Unknown"
        case 1:
            return ""
        default:
            return nameArray.last!
        }
    }
}


struct Friend: Codable {
    let id, name: String
}
