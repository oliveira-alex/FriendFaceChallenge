//
//  ContentView.swift
//  FriendFaceChallenge
//
//  Created by Alex Oliveira on 11/10/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject var users = Users()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users.users, id: \.id) { user in
                    NavigationLink(destination: UserDetailView(users: users, user: user)) {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.company)
                        }
                    }
                }
            }
            .navigationTitle("FriendFace")
            .toolbar {
                Button(action: users.fetchList) { Image(systemName: "tray.and.arrow.down") }
                    .disabled(users.users.isEmpty ? false : true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let user1 = User(id: "user1", name: "Alex Oliveira", company: "Netflix", email: "alex@oliveira.com", address: "", about: "", registered: "", isActive: true, age: 0, tags: [""], friends: [Friend(id: "user2", name: "Valdemir Junior")])
            
        let user2 = User(id: "user2", name: "Valdemir Junior", company: "Santander", email: "valdemir@junior.com", address: "", about: "", registered: "", isActive: true, age: 0, tags: [""], friends: [Friend(id: "user1", name: "Alex Oliveira")])
        
        ContentView(users: Users(user1, user2))
    }
}
