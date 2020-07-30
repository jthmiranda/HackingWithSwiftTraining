//
//  ContentView.swift
//  Project-6-Animation
//
//  Created by Jonathan Miranda on 7/25/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var enable = false
    
    var body: some View {
        Button("Tap me") {
            self.enable.toggle()
        }
        .frame(width: 140, height: 140)
        .background(enable ? Color.red : Color.blue)
        .animation(.default)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enable ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
