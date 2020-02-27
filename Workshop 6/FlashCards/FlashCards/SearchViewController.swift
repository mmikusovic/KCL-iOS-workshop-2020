//
//  SearchViewController.swift
//  FlashCards
//
//  Created by Martin Mikusovic on 27/02/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit
import WebKit

class SearchViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    
    public var card: FlashCard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let card = card, let term = searchURLString(term: card.term), let url = URL(string: term) {
            webView.load(URLRequest(url: url))
        }
    }
    
    private func searchURLString(term: String) -> String? {
        return ("https://google.com/search?q=apple developer " + term).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
}
