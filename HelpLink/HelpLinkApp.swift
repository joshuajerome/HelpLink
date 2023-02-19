//
//  HelpLinkApp.swift
//  HelpLink
//
//  Created by Soham Phadke on 2/18/23.
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
//            Home()
        }
    }
}
