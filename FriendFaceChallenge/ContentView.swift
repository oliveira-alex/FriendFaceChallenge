//
//  ContentView.swift
//  FriendFaceChallenge
//
//  Created by Alex Oliveira on 11/10/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var users = Users()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users.items, id: \.id) { user in
                    NavigationLink(destination: UserDetailView(user: user)) {
                        Text(user.name)
                    }
                }
            }
            .navigationTitle("FriendFace")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
