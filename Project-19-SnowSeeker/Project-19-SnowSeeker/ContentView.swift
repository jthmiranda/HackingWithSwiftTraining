//
//  ContentView.swift
//  Project-19-SnowSeeker
//
//  Created by Jonathan Miranda on 3/16/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
             Text("Hello, World!")
                .navigationBarTitle("Primary")
            
            Text("Secondary")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
