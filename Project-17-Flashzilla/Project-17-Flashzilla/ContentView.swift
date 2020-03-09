//
//  ContentView.swift
//  Project-17-Flashzilla
//
//  Created by Jonathan Miranda on 3/6/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // using tolerarance allows to iOS to perform energy optimization
    // it is something called timer coalescing
    // but if you need to keep time stricly then leaving off the tolerance
    let timer = Timer.publish(every: 1, tolerance: 0.5 , on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        Text("Hello world")
            .onReceive(timer) { time in
                if self.counter == 5 {
                    self.timer.upstream.connect().cancel()
                } else {
                    print("the time is now \(time)")
                }
                self.counter += 1
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
