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
            HStack {
                Text(user.name)
                
                Text("\(user.age) years old")
            }
            
            Text("Company: \(user.company)")
            Text("ID: \(user.id)")
            Spacer()
            
            Text("Friend")
            ForEach(user.friends, id: \.id) { friend in
                Text(friend.name)
            }
            
            Spacer()
        }
        .navigationBarTitle(Text(user.name), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User(id: "algen", name: "hola", age: 5, company: "company", friends: []))
    }
}
