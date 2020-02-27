//
//  Deck.swift
//  FlashCards
//
//  Created by Martin Mikusovic on 27/02/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import Foundation

class Deck {
    
    private let cards: [FlashCard]
    
    public var randomCard: FlashCard {
        return cards[Int.random(in: 0..<cards.count)]
    }
    
    init() {
        cards = [
            FlashCard(term: "UILabel", definition: "An UI element used to display text not editable by user."),
            FlashCard(term: "UIButton", definition: "A clickable UI element used for intitating some action.")
        ]
    }
}
