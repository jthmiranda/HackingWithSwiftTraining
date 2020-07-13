//
//  ContentView.swift
//  Project-8-Moonshot
//
//  Created by Jonathan Miranda on 7/11/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Decode Json") {
            let json = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Ave",
                    "city": "Nashvile"
                }
            }
            """
            
            struct User: Codable {
                let name: String
                let address: Address
            }
            
            struct Address: Codable {
                let street: String
                let city: String
            }
            
            let data = Data(json.utf8)
            let decoder = JSONDecoder()
            
            if let add = try? decoder.decode(User.self, from: data) {
                print(add.address.street)
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
