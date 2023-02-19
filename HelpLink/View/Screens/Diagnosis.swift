//
//  Diagnosis.swift
//  HelpLink
//
//  Created by Soham Phadke on 2/18/23.
//

import SwiftUI

struct Diagnosis: View {
    @State private var messageText = ""
    @State var messages: [String] = ["Questions on what to do in an emergency? I'll do my best to try and help."]
    
    var body: some View {
        VStack {
            HStack {
                Text("Diagnosis")
                    .font(.largeTitle)
                    .foregroundColor(Color("Dark"))
                    .bold()
            }
            .padding(.top, 14)
            
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    // If the message contains [USER], that means it's us
                    if message.contains("[USER]") {
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        // User message styles
                        HStack {
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(Color("Light"))
                                .background(Color("TextRed"))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                        }
                    } else {
                        
                        // Bot message styles
                        HStack {
                            Text(message)
                                .padding()
                                .background(Color.gray.opacity(0.15))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                    
                }.rotationEffect(.degrees(180))
            }
            .rotationEffect(.degrees(180))
            .background(Color.white)
            
            
            // Contains the Message bar
            HStack {
                TextField("Type something", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
                
                Button {
                    sendMessage(message: messageText)
                } label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(Color("LightPink"))
                }
                .font(.system(size: 26))
                .padding(.horizontal, 10)
            }
            .padding(.bottom, 110)
            .padding(.horizontal, 15)
        }
    }
    
    func sendMessage(message: String) {
        withAnimation {
            messages.append("[USER]" + message)
            self.messageText = ""
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    messages.append(fetch(msg: message))
                }
            }
        }
    }
}

struct Diagnosis_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
