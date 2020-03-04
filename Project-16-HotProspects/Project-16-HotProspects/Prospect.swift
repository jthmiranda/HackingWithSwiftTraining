//
//  Prospect.swift
//  Project-16-HotProspects
//
//  Created by Jonathan Miranda on 3/4/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import Foundation

class Prospect: Identifiable, Codable {
    let id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContadted = false
}

class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        self.people = []
    }
}
