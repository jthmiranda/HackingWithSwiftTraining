//
//  ContentView.swift
//  Project-12-CoreDataProject
//
//  Created by Jonathan Miranda on 3/25/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Button("Save") {
            if self.moc.hasChanges {
                try?  self.moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
