//
//  DetailView.swift
//  Milestone-Project-10-12
//
//  Created by Jonathan Miranda on 4/11/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var user: User
    
    var body: some View {
        VStack {
            VStack {
                Text(user.name)
                    .font(.title)
                Text("\(user.age) years old")
                    .font(.subheadline)
            }
            .padding([.top, .bottom])
            
            Text("Company: \(user.company)")
                .font(.body)
            Text("email: \(user.email)")
                .font(.caption)
            
            VStack {
                Text(user.address)
                    .font(.caption)
                Text("About: \(user.about)")
                    .font(.subheadline)
                
                .padding()
            }
            .padding([.top, .bottom])
            
            HStack {
                Text("Friends")
                .font(.headline)
                Spacer()
            }
            .padding([.top, .leading])
            FriendsView(friends: user.friends)
            
            
        }
        .navigationBarTitle("Usuario", displayMode: .inline)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(user: User(id: "algen", name: "hola", age: 5, company: "company", friends: []))
//    }
//}
