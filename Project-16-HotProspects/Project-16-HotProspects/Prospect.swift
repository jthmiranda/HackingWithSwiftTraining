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
    fileprivate(set) var isContadted = false
}

class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    static let saveKey = "SaveData"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
            if let decode = try? JSONDecoder().decode([Prospect].self, from: data) {
                self.people = decode
                return
            }
        }
        
        self.people = []
    }
    
    private func save() {
        if let enconde = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(enconde, forKey: Self.saveKey)
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContadted.toggle()
        save()
    }
}
