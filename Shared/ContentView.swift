//
//  ContentView.swift
//  Shared
//
//  Created by Elise Alix on 7/2/20.
//

import SwiftUI

struct ContentView: View {

    @Binding var forcePlay: Bool
    let player = Player()
    let buttonSize: CGFloat = 270

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.darkBlue, .lightBlue]),
                           startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            GeometryReader { geometry in
                Text("Airhorn+")
                    .fontWeight(.bold)
                    .font(.title)
                    .italic()
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding(30)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: geometry.size.height > geometry.size.width ? .top : .topLeading)
            }

            Button(action: {
                player.play()
            }, label: {
                ZStack {
                    Circle()
                        .frame(width: buttonSize, height: buttonSize)
                        .foregroundColor(.orange)
                        .shadow(color: Color.shadow.opacity(0.2), radius: 20, x: 20, y: 20)
                        .shadow(color: Color.shadow.opacity(0.7), radius: 20, x: -10, y: -10)

                    Text("Insert\nAirhorn")
                        .fontWeight(.semibold)
                        .kerning(0.8)
                        .font(.title)
                        .opacity(0.6)
                        .padding()
                        .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(10)
                }
            })
        }.onChange(of: forcePlay) { (force) in
            #if DEBUG
            print("forcePlay changed: \(force)")
            #endif

            if (force) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    player.play()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        player.play()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            player.play()
                        }
                    }
                }
                self.forcePlay = false
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(forcePlay: .constant(false))
    }
}
#endif
