//
//  ContentView.swift
//  Project-4-BetterRest
//
//  Created by Jonathan Miranda on 6/18/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date()
    
    
    var body: some View {
        DatePicker("", selection: $wakeUp, in: Date()..., displayedComponents: .date)
            .labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
