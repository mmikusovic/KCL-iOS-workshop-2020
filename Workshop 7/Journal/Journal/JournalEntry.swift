//
//  JournalEntry.swift
//  Journal
//
//  Created by Martin Mikusovic on 05/03/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import Foundation

class JournalEntry {
    
    let text: String
    private let date: Date
    private let dateFormatter = DateFormatter()
    var dateString: String {
        return dateFormatter.string(from: date)
    }
    
    init(with text: String) {
        self.text = text
        date = Date()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
    }
}
