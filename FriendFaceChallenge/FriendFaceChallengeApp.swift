//
//  FriendFaceChallengeApp.swift
//  FriendFaceChallenge
//
//  Created by Alex Oliveira on 11/10/21.
//

import SwiftUI

@main
struct FriendFaceChallengeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
