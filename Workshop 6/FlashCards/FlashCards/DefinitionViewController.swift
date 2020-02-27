//
//  DefinitionViewController.swift
//  FlashCards
//
//  Created by Martin Mikusovic on 27/02/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {

    @IBOutlet var definitionLabel: UILabel!
    
    public var card: FlashCard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let card = card {
            definitionLabel.text = card.definition
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SearchViewController {
            destination.card = card
        }
    }
}
