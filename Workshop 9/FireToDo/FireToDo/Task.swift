//
//  Task.swift
//  FireToDo
//
//  Created by Martin Mikusovic on 12/01/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import Foundation

struct Task {
    
    var name: String
    var id: String
    
    var dictionary: [String: Any] {
        return [
            "name": name
        ]
    }
}

extension Task {
    
    init?(dictionary: [String : Any], id: String) {
        guard let name = dictionary["name"] as? String else { return nil }
        self.init(name: name, id: id)
    }
}
