//
//  ContentView.swift
//  FriendFaceChallenge
//
//  Created by Alex Oliveira on 11/10/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink(destination: UserDetailView(users: users, user: user)) {
                        VStack(alignment: .leading) {
                            Text(user.name ?? "Unknown Name")
                                .font(.headline)
                            Text(user.company ?? "Uknown Company")
                        }
                    }
                }
            }
            .navigationTitle("FriendFace")
            .onAppear(perform: fetchUsers)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: deleteAllUsers) { Image(systemName: "trash") }
                        .disabled(users.isEmpty ? true : false)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: downloadUserList) { Image(systemName: "tray.and.arrow.down") }
                        .disabled(users.isEmpty ? false : true)
                }
            }
        }
    }
    
    func downloadUserList() {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // Most important
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            
            if let decodedUsers = try? JSONDecoder().decode([UserStruct].self, from: data) {
//                // save users in CoreData
                for user in decodedUsers {
                    let newUser = User(context: context)
                    newUser.id = user.id
                    newUser.isActive = user.isActive
                    newUser.name = user.name
                    newUser.age = user.age
                    newUser.company = user.company
                    newUser.email = user.email
                    newUser.address = user.address
                    newUser.about = user.about
                    newUser.registered = user.registered
                    newUser.tags = user.tags

                    for friend in user.friends {
                        let newFriend = Friend(context: context)
                        newFriend.id = friend.id
                        newFriend.name = friend.name

                        newUser.addToFriends(newFriend)
                    }

                }

                saveContext()
                
                DispatchQueue.main.async { fetchUsers() }
            } else {
                print("Invalid response from server")
            }
        }.resume()
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving context \(error.localizedDescription)")
            }
        }
    }
    
    func fetchUsers() {
        do {
            users = try context.fetch(User.fetchRequest())
        } catch {
            print("Couldn't fetch users: \(error.localizedDescription)")
        }
    }
    
    func deleteAllUsers() {
        for object in context.registeredObjects {
            context.delete(object)
        }
        
        saveContext()
        
        DispatchQueue.main.async { fetchUsers() }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        let user1 = User(id: "user1", name: "Alex Oliveira", company: "Netflix", email: "alex@oliveira.com", address: "", about: "", registered: "", isActive: true, age: 0, tags: [""], friends: [Friend(id: "user2", name: "Valdemir Junior")])
//            
//        let user2 = User(id: "user2", name: "Valdemir Junior", company: "Santander", email: "valdemir@junior.com", address: "", about: "", registered: "", isActive: true, age: 0, tags: [""], friends: [Friend(id: "user1", name: "Alex Oliveira")])
//        
//        ContentView(users: Users(user1, user2))
//    }
//}
