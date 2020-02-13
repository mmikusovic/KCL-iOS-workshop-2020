//
//  ViewController.swift
//  FingerPainter
//
//  Created by Martin Mikusovic on 06/02/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    private var start: CGPoint?
    private var color = UIColor.red.cgColor
    
    @IBAction func clear(_ sender: Any) {
        imageView.image = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            start = touch.location(in: imageView)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let end = touch.location(in: imageView)
            if let start = self.start {
                draw(from: start, to: end)
            }
            start = end
        }
    }
    
    private func draw(from start: CGPoint, to end: CGPoint) {
        UIGraphicsBeginImageContext(imageView.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            imageView.image?.draw(in: CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.height))
            context.setLineWidth(5)
            context.setStrokeColor(color)
            context.beginPath()
            context.move(to: start)
            context.addLine(to: end)
            context.strokePath()
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            imageView.image = newImage
        }
    }
    
    private func resetButton() {
        for v in view.subviews {
            if v is UIStackView {
                for b in v.subviews {
                    if b is UIButton {
                        b.backgroundColor = UIColor.clear
                    }
                }
            }
        }
    }
    
    @IBAction func redColor(_ sender: UIButton) {
        color = UIColor.red.cgColor
        resetButton()
        sender.backgroundColor = UIColor.red
    }
    
    @IBAction func blueColor(_ sender: UIButton) {
        color = UIColor.blue.cgColor
        resetButton()
        sender.backgroundColor = UIColor.blue
    }
    
    @IBAction func greenColor(_ sender: UIButton) {
        color = UIColor.green.cgColor
        resetButton()
        sender.backgroundColor = UIColor.green
    }
}

