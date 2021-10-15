//
//  ContentView.swift
//  FriendFaceChallenge
//
//  Created by Alex Oliveira on 11/10/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
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
                Button(action: downloadUserList) { Image(systemName: "tray.and.arrow.down") }
                    .disabled(users.isEmpty ? false : true)
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

            if let decodedUserList = try? JSONDecoder().decode([User].self, from: data) {
                DispatchQueue.main.async { self.users = decodedUserList }
            } else {
                print("Invalid response from server")
            }
        }.resume()
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
