//
//  ContentView.swift
//  Project-19-SnowSeeker
//
//  Created by Jonathan Miranda on 3/16/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct ContentView: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingAlert =  false
    
    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                self.selectedUser = User()
                self.isShowingAlert = true
            }
        .alert(isPresented: $isShowingAlert) { // prefer using the item's parameter
            Alert(title: Text(selectedUser!.id)) // avoid this unwrap
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
