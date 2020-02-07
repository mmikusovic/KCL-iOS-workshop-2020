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
            context.setStrokeColor(UIColor.red.cgColor)
            context.beginPath()
            context.move(to: start)
            context.addLine(to: end)
            context.strokePath()
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            imageView.image = newImage
        }
    }
}

