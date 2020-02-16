//
//  ContentView.swift
//  Project-14-BucketList
//
//  Created by Jonathan Miranda on 2/14/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import MapKit
import SwiftUI


struct ContentView: View {
   
    var body: some View {
        MapView()
            .edgesIgnoringSafeArea(.all)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
