//
//  HelpLinkApp.swift
//  HelpLink
//
//

import SwiftUI
import Firebase

@main
struct HelpLinkApp: App {
    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
//            ListView()
//                .environmentObject(dataManager)
            Firebase_Auth()
//            Home()
        }
    }
}
