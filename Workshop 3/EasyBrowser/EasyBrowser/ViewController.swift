//
//  ViewController.swift
//  EasyBrowser
//
//  Created by Martin Mikusovic on 06/02/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
}

//MARK:- Actions
extension ViewController {
    
    @IBAction func back(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forward(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
}

//MARK:- text field
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let url = URL(string: textField.text ?? "") {
            webView.load(URLRequest(url: url))
        }
        return true
    }
}
