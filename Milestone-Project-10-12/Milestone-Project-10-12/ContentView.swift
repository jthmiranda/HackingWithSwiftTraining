//
//  ContentView.swift
//  Milestone-Project-10-12
//
//  Created by Jonathan Miranda on 4/8/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct User: Codable {
    var id: String
    var name: String
    var age: Int
    var company: String
    var friends: [Friend]
}

struct Friend: Codable {
    var id: String
    var name: String
}
