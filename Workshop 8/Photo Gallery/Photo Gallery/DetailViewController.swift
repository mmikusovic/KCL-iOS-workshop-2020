//
//  DetailViewController.swift
//  Photo Gallery
//
//  Created by Martin Mikusovic on 12/03/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    public var image: Image?
    public var pageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image?.image
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        parent?.navigationItem.title = image?.title
    }
}
