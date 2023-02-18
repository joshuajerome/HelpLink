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
            
            Color("TabBG").ignoresSafeArea()
            
            CustomTabBar(selectedTab: $selectedTab)
        })
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
