//
//  UserDetailView.swift
//  FriendFaceChallenge
//
//  Created by Alex Oliveira on 11/10/21.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
//        NavigationView {
            VStack(alignment: .leading) {
                Text("Company: \(user.company)")
                    .padding(.leading, 18)

                List {
                    Section(header: Text("Friends")) {
                        ForEach(user.friends, id: \.id) { friend in
                            Text(friend.name)
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle(user.name)
//        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let userExample = User(id: "", isActive: true, name: "Alex Alves de Oliveira", age: 22, company: "Netflix", email: "", address: "", about: "", registered: "", tags: [""], friends: [])
        UserDetailView(user: userExample)
    }
}
