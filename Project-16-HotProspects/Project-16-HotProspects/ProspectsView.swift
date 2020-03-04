//
//  ProspectsView.swift
//  Project-16-HotProspects
//
//  Created by Jonathan Miranda on 3/4/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

enum FilterType {
    case none, contacted, uncontacted
}

struct ProspectsView: View {
    @EnvironmentObject var prospects: Prospects
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    var body: some View {
        NavigationView {
            Text("People: \(prospects.people.count)")
                .navigationBarTitle(title)
                .navigationBarItems(trailing: Button(action: {
                    let prospect = Prospect()
                    prospect.name = "Paul Hudson"
                    prospect.emailAddress = "paul@hackingwithswift.com"
                    self.prospects.people.append(prospect)
                }) {
                    Image(systemName: "qrcode.viewfinder")
                    Text("Scan")
                })
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
