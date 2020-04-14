//
//  FriendsView.swift
//  Milestone-Project-10-12
//
//  Created by Jonathan Miranda on 4/12/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct FriendsView: View {
    var friends: [Friend]
    
    var body: some View {
        List(friends, id: \.id) { friend in
            NavigationLink(destination: Text(friend.name)) {
                Text(friend.name)
            }
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView(friends: [Friend(id: "79879", name: "Test")])
    }
}
