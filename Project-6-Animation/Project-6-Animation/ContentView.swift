//
//  ContentView.swift
//  Project-6-Animation
//
//  Created by Jonathan Miranda on 7/25/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me ") {
            self.animationAmount += 360.0
        }
        .padding(40)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        .animation(.interpolatingSpring(stiffness: 5, damping: 1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
