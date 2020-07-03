//
//  Player.swift
//  AirHorn+
//
//  Created by Elise Alix on 7/2/20.
//

import AVFoundation

class Player {

    let url = URL(fileURLWithPath: Bundle.main.path(forResource: "airhorn.mp3", ofType: nil) ?? "")

    var airhorn1: AVAudioPlayer?
    var airhorn2: AVAudioPlayer?
    var airhorn3: AVAudioPlayer?
    var airhorn4: AVAudioPlayer?
    var airhorn5: AVAudioPlayer?
    var airhorn6: AVAudioPlayer?

    var players: Array<AVAudioPlayer?> = []
    var lastPlayed = 0

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
    }

    func play() {
        for i in lastPlayed..<(lastPlayed + players.count) {
            let next = (i + 1) % players.count
            let player = players[next]

            if (player?.isPlaying != true) {
                player?.play()
                print(lastPlayed)
                lastPlayed = next
                break
            }
        }
    }
}
