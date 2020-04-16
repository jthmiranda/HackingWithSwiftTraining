//
//  ContentView.swift
//  Milestone-Project-10-12
//
//  Created by Jonathan Miranda on 4/8/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                NavigationLink(destination: DetailView(user: user)) {
                    Text(user.name)
                        .font(.headline)
                }
            }
            .onAppear(perform: loadData)
            .navigationBarTitle("Usuarios")
        }
    }
    
    func loadData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            let decoder = JSONDecoder()
            if let data = data {
                if let decodeResponse = try? decoder.decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        //print(decodeResponse.first.debugDescription)
                        self.users = decodeResponse
                    }
                    return
                }
            }
            
            print("fetch failure: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct User: Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friend]
}

struct Friend: Codable {
    var id: String
    var name: String
}
