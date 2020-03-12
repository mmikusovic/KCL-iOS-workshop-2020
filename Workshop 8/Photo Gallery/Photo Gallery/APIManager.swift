//
//  APIManager.swift
//  Photo Gallery
//
//  Created by Martin Mikusovic on 12/03/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import Foundation

class APIManager {
    
    public static let shared = APIManager()
    
    public func getBooks(completion: @escaping (_ books: [Book]?) -> ()) {
        guard let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=flowers") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                if let data = data {
                    let response = try JSONDecoder().decode(BookResponse.self, from: data)
                    completion(response.items)
                } else {
                    completion(nil)
                }
            } catch {
                completion(nil)
            }
        }
        task.resume()
    }
    
    public func getImage(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
