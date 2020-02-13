//
//  ViewController.swift
//  Stopwatch
//
//  Created by Martin Mikusovic on 13/02/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    private let stopwatch = Stopwatch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopwatch.delegate = self
    }

    @IBAction func start(_ sender: Any) {
        if !stopwatch.isRunning {
            stopwatch.start()
            stopButton.setTitle("Stop", for: .normal)
        }
    }
    
    @IBAction func stop(_ sender: UIButton) {
        if sender.titleLabel?.text == "Stop" && stopwatch.isRunning {
            stopwatch.stop()
            stopButton.setTitle("Reset", for: .normal)
        } else {
            stopwatch.reset()
            stopButton.setTitle("Stop", for: .normal)
        }
    }
}

extension ViewController: StopwatchDelegate {
    
    func update(with text: String) {
        timeLabel.text = text
    }
}
