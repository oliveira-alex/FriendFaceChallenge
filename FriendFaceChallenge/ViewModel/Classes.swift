//
//  ViewModel.swift
//  FriendFaceChallenge
//
//  Created by Alex Oliveira on 11/10/21.
//

//import Foundation
//
//class Users: ObservableObject, Codable {
//    enum CodingKeys: CodingKey {
//        case users
//    }
//    
//    @Published var users: [User]
//    
//    init(_ users: User...) {
//        if users.isEmpty {
//            self.users = [User]()
//        } else {
//            self.users = users
//        }
//    }
//    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        users = try container.decode([User].self, forKey: .users)
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        
//        try container.encode(users, forKey: .users)
//    }
//
//    func fetchList() {
////        var usersArray = [User]()
////
////        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
////        if let usersJSONArray = try? Data(contentsOf: url) {
////            do {
////                usersArray = try JSONDecoder().decode([User].self, from: usersJSONArray)
////            } catch {
////                print("This was the error: \(error.localizedDescription)")
////            }
////        } else {
////            print("Failed fetching usersJSON")
////        }
////
////        self.users = usersArray
//        
//        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
//        var request = URLRequest(url: url)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        // Most important
//        request.httpMethod = "GET"
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard let data = data else {
//                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
//                return
//            }
//
//            if let decodedUserList = try? JSONDecoder().decode([User].self, from: data) {
//                DispatchQueue.main.async { self.users = decodedUserList }
//            } else {
//                print("Invalid response from server")
//            }
//        }.resume()
//    }
//
//    func findUser(id: String) -> User? {
//        return users.first(where: { $0.id == id })
//    }
//}
