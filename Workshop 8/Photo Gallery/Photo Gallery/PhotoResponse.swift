//
//  PhotoResponse.swift
//  Photo Gallery
//
//  Created by Martin Mikusovic on 12/03/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit

class BookResponse: Codable {
    var items: [Book]
}

class Book: Codable {
    var volumeInfo: BookInfo
}

class BookInfo: Codable {
    var title: String
    var imageLinks: BookImages
}

class BookImages: Codable {
    var thumbnail: String
}


struct Image {
    var title: String
    var image: UIImage
}
