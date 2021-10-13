//
//  UserDetailView.swift
//  FriendFaceChallenge
//
//  Created by Alex Oliveira on 11/10/21.
//

import SwiftUI

struct UserDetailView: View {
    let users: Users
    let user: User

    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.headline)
                .padding(.leading, 17)
            Text(user.email)
                .padding(.leading, 17)

            List {
                Section(header: Text("Friends")) {
                    ForEach(user.friends, id: \.id) { friend in
                        NavigationLink(destination: UserDetailView(users: users, user: users.findUser(id: friend.id)!)) {
                            VStack(alignment: .leading) {
                                Text(friend.name)
                                    .font(.headline)
                                Text(users.findUser(id: friend.id)!.company)
                            }
                        }
                    }
                }
            }
            .padding(.vertical)
        }
        .navigationTitle(user.lastName)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let user1 = User(id: "user1", name: "Alex Oliveira", company: "Netflix", email: "alex@oliveira.com", address: "", about: "", registered: "", isActive: true, age: 0, tags: [""], friends: [Friend(id: "user2", name: "Valdemir Junior")])
            
        let user2 = User(id: "user2", name: "Valdemir Junior", company: "Santander", email: "valdemir@junior.com", address: "", about: "", registered: "", isActive: true, age: 0, tags: [""], friends: [Friend(id: "user1", name: "Alex Oliveira")])

        NavigationView {
            UserDetailView(users: Users(user1, user2), user: user1)
        }
    }
}
