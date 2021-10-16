//
//  UserDetailView.swift
//  FriendFaceChallenge
//
//  Created by Alex Oliveira on 11/10/21.
//

import SwiftUI

struct UserDetailView: View {
    let users: [User]
    let user: User

    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name ?? "Unknown Name")
                .font(.headline)
                .padding(.leading, 17)
            Text(user.email ?? "Unknown E-mail")
                .padding(.leading, 17)

            List {
                Section(header: Text("Friends")) {
                    ForEach(user.friendsArray, id: \.id) { friend in
                        NavigationLink(destination: UserDetailView(users: users, user: findUser(id: friend.id!))) {
                            VStack(alignment: .leading) {
                                Text(friend.name ?? "Unknown Name")
                                    .font(.headline)
                                Text(findUser(id: friend.id!).company ?? "Unknown Company")
                            }
                        }
                    }
                }
            }
            .padding(.vertical)
        }
        .navigationTitle(user.lastName)
    }
    
    func findUser(id: String) -> User {
        return users.first(where: { $0.id == id })!
    }
}

//struct UserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let user1 = User(id: "user1", name: "Alex Oliveira", company: "Netflix", email: "alex@oliveira.com", address: "", about: "", registered: "", isActive: true, age: 0, tags: [""], friends: [Friend(id: "user2", name: "Valdemir Junior")])
//            
//        let user2 = User(id: "user2", name: "Valdemir Junior", company: "Santander", email: "valdemir@junior.com", address: "", about: "", registered: "", isActive: true, age: 0, tags: [""], friends: [Friend(id: "user1", name: "Alex Oliveira")])
//
//        NavigationView {
//            UserDetailView(users: Users(user1, user2), user: user1)
//        }
//    }
//}
