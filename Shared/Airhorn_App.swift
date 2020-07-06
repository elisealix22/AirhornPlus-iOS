//
//  Airhorn_App.swift
//  Shared
//
//  Created by Elise Alix on 7/2/20.
//

import SwiftUI

@main
struct Airhorn_App: App {

    @State var forcePlay: Bool = false

    var body: some Scene {
        WindowGroup {
            ContentView(forcePlay: $forcePlay)
                .onOpenURL { url in
                    self.forcePlay = url.host == "play"
                }
        }
    }
}
