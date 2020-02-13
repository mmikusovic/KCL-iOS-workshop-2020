//
//  ViewController.swift
//  Gesturizer
//
//  Created by Martin Mikusovic on 13/02/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var swipeGR: UISwipeGestureRecognizer!
    @IBOutlet var panGR: UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        panGR.require(toFail: swipeGR)
    }
    
    private func showGesture(with name: String) {
        label.text = name
        UIView.animate(withDuration: 1, animations: {
            self.label.alpha = 1
        }) { (_) in
            UIView.animate(withDuration: 1) {
                self.label.alpha = 0
            }
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            showGesture(with: "Shake")
        }
    }

    @IBAction func singleTap(_ sender: Any) {
        showGesture(with: "Tap")
    }
    
    @IBAction func doubleTap(_ sender: Any) {
        showGesture(with: "Double Tap")
    }
    
    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .ended {
            showGesture(with: "Pinch")
        }
    }
    
    @IBAction func rotation(_ sender: UIRotationGestureRecognizer) {
        if sender.state == .ended {
            showGesture(with: "Rotation")
        }
    }
    
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .right {
            showGesture(with: "Swipe")
        }
    }
    
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        if sender.state == .ended {
            showGesture(with: "Pan")
        }
    }
    
    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .recognized {
            showGesture(with: "Long press")
        }
    }
}

