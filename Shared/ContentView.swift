//
//  ContentView.swift
//  Shared
//
//  Created by Elise Alix on 7/2/20.
//

import SwiftUI

struct ContentView: View {

    let buttonSize: CGFloat = 270

    let backgroundColor = Color(red: 0 / 255, green: 5 / 255, blue: 77 / 255)
    let backgroundColor2 = Color(red: 92 / 255, green: 139 / 255, blue: 169 / 255)
    let shadowColor = Color(red: 3 / 255, green: 3 / 255, blue: 26 / 255)
    let buttonColor = Color(red: 232 / 255, green: 82 / 255, blue: 39 / 255)

    let player = Player()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [backgroundColor, backgroundColor2]),
                           startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            Text("Airhorn+")
                .fontWeight(.bold)
                .font(.title)
                .italic()
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .padding(30)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

            Button(action: {
                player.play()
            }, label: {
                ZStack {
                    Circle()
                        .frame(width: buttonSize, height: buttonSize)
                        .foregroundColor(buttonColor)
                        .shadow(color: shadowColor.opacity(0.2), radius: 20, x: 20, y: 20)
                        .shadow(color: shadowColor.opacity(0.7), radius: 20, x: -10, y: -10)

                    Text("INSERT\nAIRHORN")
                        .fontWeight(.semibold)
                        .kerning(0.8)
                        .font(.title)
                        .opacity(0.6)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(10)
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
