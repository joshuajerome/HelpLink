//
//  CustomTabBar.swift
//  HelpLink
//
//  Created by Soham Phadke on 2/18/23.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTab: String
    
    @State var tabPoints : [CGFloat] = []
    
    var body: some View {
        
        
        HStack(spacing: 0) {
            
            // Tab Bar Buttons...
            
            TabBarButton(image: "list.clipboard", selectedTab: $selectedTab, tabPoints: $tabPoints)
            
            TabBarButton(image: "house", selectedTab: $selectedTab, tabPoints: $tabPoints)
            
            TabBarButton(image: "person", selectedTab: $selectedTab, tabPoints: $tabPoints)
                
        }
        .padding()
        .background(
            Color.white
                .clipShape(TabCurve(tabPoint: getCurvePoint() - 15))
        )
        .overlay(
            Circle()
                .fill(Color.white)
                .frame(width: 10, height: 10)
                .offset(x: getCurvePoint() - 20)
                
            , alignment: .bottomLeading
        )
        .cornerRadius(30)
        .padding(.horizontal)
    }
    
    func getCurvePoint() -> CGFloat {
        
        if tabPoints.isEmpty {
            return 10
        } else {
            switch selectedTab {
            case "list.clipboard":
                return tabPoints[0]
            case "house":
                return tabPoints[1]
            default:
                return tabPoints[2]
            }
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct TabBarButton: View {
    
    var image: String
    @Binding var selectedTab: String
    @Binding var tabPoints: [CGFloat]
    
    var body: some View {
        GeometryReader { reader -> AnyView in
            
            let midX = reader.frame(in: .global).midX
            
            DispatchQueue.main.async {
                if tabPoints.count <= 3 {
                    tabPoints.append(midX)
                }
            }
            
            return AnyView(
                
                Button(action: {
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)) {
                        selectedTab = image
                    }
                }, label : {
                    
                    
                    Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "")")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(Color("TabSelected"))
                    
                        .offset(y: selectedTab == image ? -10 : 0)
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            )
        }
        .frame(height: 50)
    }
}
