//
//  Card.swift
//  HelpLink
//
//  Created by Soham Phadke on 2/19/23.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID().uuidString
    var name: String
    var email: String
    var emergencyContacts: [MyStruct]
    var conditions: [MyStruct]
    var cardImage: String
}

var cards: [Card] = [
    
    Card(name: "Suvass Ravala", email: "sravala@gmail.com", emergencyContacts: [MyStruct("Mom", "408-376-8363", "Primary"), MyStruct("Dad", "408-346-8243", "Secondary")], conditions: [MyStruct("Seizures", "What needs to be done.", "Moderate Risk"), MyStruct("Peanut Allergies", "What needs to be done.", "High Risk")], cardImage: "Card1"),
    Card(name: "Raghav Batra", email: "sravala@gmail.com", emergencyContacts: [MyStruct("Mom", "408-376-8363", "Primary"), MyStruct("Dad", "408-346-8243", "Secondary")], conditions: [MyStruct("Seizures", "What needs to be done.", "Moderate Risk"), MyStruct("Peanut Allergies", "What needs to be done.", "High Risk")], cardImage: "Card2"),
    Card(name: "Suvass Ravala", email: "sravala@gmail.com", emergencyContacts: [MyStruct("Mom", "408-376-8363", "Primary"), MyStruct("Dad", "408-346-8243", "Secondary")], conditions: [MyStruct("Seizures", "What needs to be done.", "Moderate Risk"), MyStruct("Peanut Allergies", "What needs to be done.", "High Risk")], cardImage: "Card1")
]

struct MyStruct {
    var title: String
    var description: String
    var caption: String
    
    init(_ title: String, _ description: String, _ caption: String) {
        self.title = title
        self.description = description
        self.caption = caption
    }
}
