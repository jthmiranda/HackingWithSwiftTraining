//
//  ResortDetailsView.swift
//  Project-19-SnowSeeker
//
//  Created by Jonathan Miranda on 3/17/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct ResortDetailsView: View {
    let resort: Resort
    
    var size: String  {
        switch resort.size {
        case 1:
            return "Small"
        case 2:
            return "Average"
        default:
            return "Large"
        }
    }
    
    var price: String {
        String(repeating: "$", count: resort.price)
    }
    
    var body: some View {
        VStack {
            Text("Size: \(size)")
            Text("Price: \(price)")
        }
    }
}

struct ResortDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ResortDetailsView(resort: Resort.example)
    }
}
