//
//  ViewController.swift
//  XcodeDemo
//
//  Created by Martin Mikusovic on 30/01/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonTapped(_ sender: Any) {
        print("yes")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.setTitle("print yes", for: .normal)
    }


}

