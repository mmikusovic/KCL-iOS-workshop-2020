//
//  NoiseMaker.swift
//  NoiseMaker
//
//  Created by Martin Mikusovic on 27/02/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import AVFoundation

class NoiseMaker {
    
    let files = ["guitar", "applause", "monster", "bubbles"]
    
    var players: [AVAudioPlayer?]
    
    init() {
        players = files.map({ name in
            if let url = Bundle.main.url(forResource: name, withExtension: "wav") {
                return try? AVAudioPlayer(contentsOf: url)
            }
            return nil
        })
    }
    
    func play(index: Int) {
        players[index]?.play()
    }
}
