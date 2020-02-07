//
//  ViewController.swift
//  Clock
//
//  Created by Martin Mikusovic on 06/02/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        label.text = formatter.string(from: Date())
    }
}
