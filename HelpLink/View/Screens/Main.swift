//
//  Main.swift
//  HelpLink
//
//  Created by Soham Phadke on 2/18/23.
//

import SwiftUI

struct Main: View {
    
    @State var expandCards: Bool = false
    
    @State var currentCard: Card?
    @State var showDetailCard: Bool = false
    @Namespace var animation
    
    var body: some View {
        VStack(spacing: 0, content: {
            
            Text("Wallet")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: expandCards ? .leading : .center)
                .overlay(alignment: .trailing) {
                    
                    Button {
                        withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.7)) {
                            expandCards = false
                        }
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.blue, in: Circle())
                    }
                    .rotationEffect(.init(degrees: expandCards ? 45 : 0))
                    .offset(x: expandCards ? 10 : 15)
                    .opacity(expandCards ? 1 : 0)
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 10)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 0) {
                    
                    ForEach(cards) { card in
                        Group {
                            if currentCard?.id == card.id && showDetailCard {
                                CardView(card: card)
                                    .opacity(0)
                            } else {
                                CardView(card: card)
                                    .matchedGeometryEffect(id: card.id, in: animation)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                currentCard = card
                                showDetailCard = true
                            }
                        }
                    }
                }
                .overlay {
                    Rectangle()
                        .fill(.black.opacity(expandCards ? 0 : 0.01))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                expandCards = true
                            }
                        }
                }
                .padding(.top, expandCards ? 30 : 0)
            }
            .coordinateSpace(name: "SCROLL")
            .offset(y: expandCards ? 0 : 30)
            
            Button {
                
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(.blue, in: Circle())
            }
            .rotationEffect(.init(degrees: expandCards ? 180 : 0))
            .scaleEffect(expandCards ? 0.01 : 1)
            .opacity(!expandCards ? 1 : 0)
            .frame(minHeight: expandCards ? 0 : nil)
            .padding(.bottom, expandCards ? 0 : 100)
        })
        .padding([.horizontal, .top])
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .bottom) {
            if let currentCard = currentCard,showDetailCard {
                DetailView(currentCard: currentCard, showDetailCard: $showDetailCard, animation: animation)
            }
        }
    }
    
    @ViewBuilder
    func CardView(card: Card) -> some View {
        GeometryReader { proxy in
            
            let rect = proxy.frame(in: .named("SCROLL"))
            let offset = CGFloat(getIndex(Card: card) * (expandCards ? 10 : 70))
            
            ZStack(alignment: .bottomLeading) {
                
//                Image(card.cardImage)
                var gradientStart = (card.cardImage == "Card2" ? Color("LightPink") : Color.blue)
                var gradientEnd = (card.cardImage == "Card2" ? Color.red : Color("LightPink"))
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(LinearGradient(gradient: .init(colors: [gradientStart, gradientEnd]), startPoint: .init(x: 0.5, y: 0), endPoint: .init(x: 0.5, y: 0.6)))
                    .frame(height: 250)
                    .foregroundColor(card.cardImage == "Card1" ? .blue : .orange)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(card.name)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    Text(card.email)
                        .font(.callout)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                .padding(.bottom, 10)
                .foregroundColor(.white)
            }
            .offset(y: expandCards ? offset : -rect.minY + offset)
        }
        .frame(height: 250)
    }
    
    func getIndex(Card: Card) -> Int {
        return cards.firstIndex { currentCard in
            return currentCard.id == Card.id
        } ?? 0
    }
    
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}

struct DetailView: View {
    var currentCard: Card
    @Binding var showDetailCard: Bool
    
    var animation: Namespace.ID
    
    @State var showExpenseView: Bool = false
    
    var body: some View {
        
        VStack {
            CardView()
                .matchedGeometryEffect(id: currentCard.id, in: animation)
                .frame(height: 200)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.35)) {
                        showExpenseView = false
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(.easeInOut(duration: 0.35)) {
                            showDetailCard = false
                        }
                    }
                }
                .zIndex(10)
                .padding(.horizontal, 20)
                .padding(.vertical, 40)
            
            GeometryReader { proxy in
                
                let height = proxy.size.height + 50
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 20) {
                        Text("Item 1")
                        Text("Item 2")
                        Text("Item 3")
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
                .background(
                    Color.white
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .ignoresSafeArea()
                )
                .offset(y: showExpenseView ? 0 : height)
            }
            .padding([.horizontal, .top])
            .zIndex(-10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("Light").ignoresSafeArea())
        .onAppear {
            withAnimation(.easeInOut.delay(0.1)) {
                showExpenseView = true
            }
        }
    }
    
    @ViewBuilder
    func CardView() -> some View {
        ZStack(alignment: .bottomLeading) {
            
            var gradientStart = (currentCard.cardImage == "Card2" ? Color("LightPink") : Color.blue)
            var gradientEnd = (currentCard.cardImage == "Card2" ? Color.red : Color("LightPink"))
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(LinearGradient(gradient: .init(colors: [gradientStart, gradientEnd]), startPoint: .init(x: 0.5, y: 0), endPoint: .init(x: 0.5, y: 0.6)))
                .frame(height: 250)
                .foregroundColor(currentCard.cardImage == "Card1" ? .blue : .orange)
//            Image(currentCard.cardImage)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(currentCard.name)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text(currentCard.email)
                    .font(.callout)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            .padding(.bottom, 10)
            .foregroundColor(.white)
        }
    }
}
