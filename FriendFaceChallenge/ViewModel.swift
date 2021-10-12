//
//  ViewModel.swift
//  FriendFaceChallenge
//
//  Created by Alex Oliveira on 11/10/21.
//

import Foundation

class Users: Codable {
    let items: [User]
    
    init() {
        var usersArray = [User]()
        
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        if let usersJSONArray = try? Data(contentsOf: url) {
            do {
                usersArray = try JSONDecoder().decode([User].self, from: usersJSONArray)
            } catch {
                print("This was the error: \(error.localizedDescription)")
            }
        } else {
            print("Failed fetching usersJSON")
        }
        
        self.items = usersArray
    }
}
