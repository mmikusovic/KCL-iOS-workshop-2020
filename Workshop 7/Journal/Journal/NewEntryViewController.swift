//
//  NewEntryViewController.swift
//  Journal
//
//  Created by Martin Mikusovic on 05/03/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit

protocol NewEntryDelegate {
    func add(entry: JournalEntry)
}

class NewEntryViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    var delegate: NewEntryDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.becomeFirstResponder()
        navigationController?.navigationBar.tintColor = UIColor(named: "Fuchsia")
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        let entry = JournalEntry(with: textView.text)
        delegate?.add(entry: entry)
        dismiss(animated: true, completion: nil)
    }
}
