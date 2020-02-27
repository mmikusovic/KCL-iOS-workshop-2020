//
//  ViewController.swift
//  NoiseMaker
//
//  Created by Martin Mikusovic on 27/02/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let noiseMaker = NoiseMaker()

    @IBAction func buttonTapped(_ sender: UIButton) {
        noiseMaker.play(index: sender.tag)
    }
}

