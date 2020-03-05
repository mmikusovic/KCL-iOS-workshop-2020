//
//  JournalDetailViewController.swift
//  Journal
//
//  Created by Martin Mikusovic on 05/03/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit

class JournalDetailViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    public var entry: JournalEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let entry = entry {
            label.text = entry.text
            navigationItem.title = entry.dateString
        }
    }
}
