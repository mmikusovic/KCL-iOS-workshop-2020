//
//  TermViewController.swift
//  FlashCards
//
//  Created by Martin Mikusovic on 27/02/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit

class TermViewController: UIViewController {

    @IBOutlet var termLabel: UILabel!
    
    private let deck = Deck()
    
    private var card: FlashCard?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        card = deck.randomCard
        termLabel.text = card?.term
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DefinitionViewController {
            destination.card = card
        }
    }
}

