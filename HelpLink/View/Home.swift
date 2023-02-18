//
//  Home.swift
//  HelpLink
//
//  Created by Soham Phadke on 2/18/23.
//

import SwiftUI

struct Home: View {
    @State var selectedTab = "house"
    
    var body: some View {
        
        ZStack(alignment: .bottom, content: {
            
            if selectedTab == "house" {
                Main()
            } else if selectedTab == "person" {
                Profile()
            } else {
                Diagnosis()
            }
            
            CustomTabBar(selectedTab: $selectedTab)
        })
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
