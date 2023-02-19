//
//  HelpLinkApp.swift
//  HelpLink
//
//

import SwiftUI
import Firebase

@main
struct HelpLinkApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            Firebase_Auth()
        }
    }
}
