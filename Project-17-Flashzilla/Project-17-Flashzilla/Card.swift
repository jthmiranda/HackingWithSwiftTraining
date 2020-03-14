//
//  Card.swift
//  Project-17-Flashzilla
//
//  Created by Jonathan Miranda on 3/10/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import Foundation


struct Card: Codable {
    let prompt: String
    let answer: String
    
    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
