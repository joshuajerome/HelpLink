//
//  Profile.swift
//  HelpLink
//
//  Created by Soham Phadke on 2/18/23.
//

import SwiftUI

struct Profile: View {
    
    @State var index = 0
    
    var body: some View {
        
        ZStack {
            Color("TabBG").ignoresSafeArea()
            ScrollView {
                VStack {
                    HStack(alignment: .top, content: {
                        Text("Profile")
                            .font(.largeTitle)
                            .foregroundColor(Color("TextColor"))
                            .fontWeight(.bold)
                    })
                    .padding()
                    
                    HStack {
                        VStack(spacing: 0) {
                            Rectangle()
                                .fill(Color("TabBG"))
                                .frame(width: 100, height: 3)
                            
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .padding(EdgeInsets(top: 6, leading: 8, bottom: 4, trailing: 8))
                                .background(Color("TabSelected"))
                                .cornerRadius(10)
                                .shadow(color: Color.white.opacity(0.1), radius: 5, x: 8, y: 8)
                                .shadow(color: Color.black.opacity(0.5), radius: 5, x: -8, y: -8)
                        }
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Suvass Ravala")
                                .font(.title)
                                .fontWeight(.medium)
                                .foregroundColor(Color("TextColor").opacity((0.8)))
                            
                            Text("suvassr@abcdmail")
                                .foregroundColor(Color("TextColor").opacity((0.7)))
                                .padding(.top, 8)
                        }
                        .padding(.leading, 20)
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    HStack {
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            
                            self.index = 0
                            
                        }) {
                            
                            Text("Emergency \nContacts")
                                .foregroundColor(self.index == 0 ? Color(uiColor: UIColor.systemTeal) : Color("TextColor"))
                                .padding(.vertical, 10)
                                .padding(.horizontal)
                                .background(self.index == 0 ? Color("TabSelected") : Color.clear)
                                .cornerRadius(10)
                        }
                        .padding(.leading, -40)
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            
                            self.index = 1
                            
                        }) {
                            
                            Text("Conditions")
                                .foregroundColor(self.index == 1 ? Color(uiColor: UIColor.systemTeal) : Color("TextColor"))
                                .padding(.vertical, 10)
                                .padding(.horizontal)
                                .background(self.index == 1 ? Color("TabSelected") : Color.clear)
                                .cornerRadius(10)
                        }
                        .padding(.trailing, -40)
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color("TabBG"))
                    .cornerRadius(8)
                    .frame(width: 290)
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 8, y: 8)
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: -8, y: -8)
                    .padding(.horizontal)
                    .padding(.top, 25)
                    
                    if index == 0 {
                        EmergencyContacts()
                    } else {
                        Conditions()
                    }
                    
                    Spacer(minLength: 100)
                }
            }
            
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}

struct Conditions: View {
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                
                VStack(spacing: 12) {
                    Image(systemName: "waveform.path.ecg.rectangle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                    
                    Text("Seizures")
                        .font(.title)
                        .padding(.top, 10)
                    
                    Text("This is what you should do if I have a seizure. Specific Instructions go here")
                        .foregroundColor(.blue)
                        .padding(.horizontal, 20)
                    Text("Minor Severity")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
                .frame(width: (UIScreen.main.bounds.width - 60) / 2)
                .background(Color("TextColor"))
                .cornerRadius(15)
                .shadow(color: Color.white.opacity(0.1), radius: 5, x: 8, y: 8)
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: -8, y: -8)
                .frame(height: 350)
                
                VStack(spacing: 12) {
                    Image(systemName: "syringe")
                        .resizable()
                        .frame(width: 80, height: 80)
                    
                    Text("Allergies")
                        .font(.title)
                        .padding(.top, 10)
                    
                    Text("This is what you should do if I get severe allergies. Further directions here.")
                        .foregroundColor(.blue)
                        .padding(.horizontal, 20)
                    Text("High Severity")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
                .frame(width: (UIScreen.main.bounds.width - 60) / 2)
                .background(Color("TextColor"))
                .cornerRadius(15)
                .shadow(color: Color.white.opacity(0.1), radius: 5, x: 8, y: 8)
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: -8, y: -8)
                .frame(height: 350)
                
                
            }
            .padding(.top, 20)
        }
        Spacer(minLength: 20)
    }
}

struct EmergencyContacts: View {
    
    var body: some View {
        HStack(spacing: 20) {
            
            VStack(spacing: 12) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                
                Text("Mom")
                    .font(.title)
                    .padding(.top, 10)
                
                Text("408-578-9834")
                    .foregroundColor(.blue)
                Text("1 Year")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.vertical)
            .frame(width: (UIScreen.main.bounds.width - 60) / 2)
            .background(Color("TextColor"))
            .cornerRadius(15)
            .shadow(color: Color.white.opacity(0.1), radius: 5, x: 8, y: 8)
            .shadow(color: Color.black.opacity(0.5), radius: 5, x: -8, y: -8)
            
            VStack(spacing: 12) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                
                Text("Dad")
                    .font(.title)
                    .padding(.top, 10)
                
                Text("408-457-8753")
                    .foregroundColor(.blue)
                Text("1 Year")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.vertical)
            .frame(width: (UIScreen.main.bounds.width - 60) / 2)
            .background(Color("TextColor"))
            .cornerRadius(15)
            .shadow(color: Color.white.opacity(0.1), radius: 5, x: 8, y: 8)
            .shadow(color: Color.black.opacity(0.5), radius: 5, x: -8, y: -8)
            
            
        }
        .padding(.top, 20)
    }
}
