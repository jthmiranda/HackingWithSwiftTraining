//
//  ContentView.swift
//  Project-17-Flashzilla
//
//  Created by Jonathan Miranda on 3/6/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        VStack {
            VStack {
                Text("Hello")
                // SwiftUI won't trigger actions when a stack spacer is tapped
                Spacer().frame(height: 100)
                
                Text("World")
            }
            .onTapGesture {
                print("Vstack tapped!")
            }
            // this is anothe way to be able to tap a control below when using Zstack
            // .allowsHitTesting(false)
            
            Spacer().frame(height: 100)
            
            VStack {
                Text("Hello")
                
                Spacer().frame(height: 100)
                
                Text("World")
            }
                // If you want the whole vstack tappalge use contentShape modifier
                .contentShape(Rectangle())
                .onTapGesture {
                    print("Vstack tapped!")
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
