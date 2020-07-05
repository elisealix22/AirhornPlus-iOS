//
//  Player.swift
//  AirHorn+
//
//  Created by Elise Alix on 7/2/20.
//

import SwiftUI
import AVFoundation

struct Player {

    private let url = URL(fileURLWithPath: Bundle.main.path(forResource: "airhorn.mp3", ofType: nil) ?? "")

    private var airhorn1: AVAudioPlayer?
    private var airhorn2: AVAudioPlayer?
    private var airhorn3: AVAudioPlayer?
    private var airhorn4: AVAudioPlayer?
    private var airhorn5: AVAudioPlayer?
    private var airhorn6: AVAudioPlayer?

    private var players: Array<AVAudioPlayer?> = []

    @State private var lastPlayed = 0

    init() {
        do {
            airhorn1 = try AVAudioPlayer(contentsOf: url)
            airhorn2 = try AVAudioPlayer(contentsOf: url)
            airhorn3 = try AVAudioPlayer(contentsOf: url)
            airhorn4 = try AVAudioPlayer(contentsOf: url)
            airhorn5 = try AVAudioPlayer(contentsOf: url)
            airhorn6 = try AVAudioPlayer(contentsOf: url)

            airhorn1?.prepareToPlay()
            airhorn2?.prepareToPlay()
            airhorn3?.prepareToPlay()
            airhorn4?.prepareToPlay()
            airhorn5?.prepareToPlay()
            airhorn6?.prepareToPlay()

            players = [airhorn1, airhorn2, airhorn3, airhorn4, airhorn5, airhorn6]

        } catch {
            // Couldn't find file
        }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch {
            // Couldn't override silent mode
        }
    }

    func play() {
        for i in lastPlayed..<(lastPlayed + players.count) {
            let next = (i + 1) % players.count
            let player = players[next]

            if (player?.isPlaying != true) {
                player?.play()
                lastPlayed = next
                break
            }
        }
    }
}
