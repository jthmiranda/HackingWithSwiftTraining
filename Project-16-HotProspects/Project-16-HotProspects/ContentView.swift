//
//  ContentView.swift
//  Project-16-HotProspects
//
//  Created by Jonathan Miranda on 3/2/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    
    var body: some View {
        TabView {
            ProspectsView(filter: .none)
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Everyone")
                }
            ProspectsView(filter: .contacted)
                .tabItem {
                    Image(systemName: "checkmark.circle")
                    Text("Contacted")
                }
            ProspectsView(filter: .uncontacted)
                .tabItem {
                    Image(systemName: "questionmark.diamond")
                    Text("Uncontacted")
                }
            MeView()
                .tabItem {
                    Image(systemName: "person.crop.square")
                    Text("Me")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
