//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by Martin Mikusovic on 13/02/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import Foundation

protocol StopwatchDelegate {
    func update(with text: String)
}

class Stopwatch {
    
    private var elapsedTime = TimeInterval()
    private var timer: Timer?
    private var elapsedTimeString: String {
        return String(format: "%02d:%02d.%d", Int(elapsedTime/60), Int(elapsedTime) % 60, Int(elapsedTime * 10) % 10)
    }
    
    public var isRunning = false
    public var delegate: StopwatchDelegate?
    
    public func start() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            self.elapsedTime += 0.1
            self.delegate?.update(with: self.elapsedTimeString)
        })
    }
    
    public func stop() {
        isRunning = false
        timer?.invalidate()
    }
    
    public func reset() {
        elapsedTime = 0
        delegate?.update(with: elapsedTimeString)
    }
}
