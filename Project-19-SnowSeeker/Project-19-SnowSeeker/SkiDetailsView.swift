//
//  SkiDetailsView.swift
//  Project-19-SnowSeeker
//
//  Created by Jonathan Miranda on 3/17/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct SkiDetailsView: View {
    let resort: Resort
    
    var body: some View {
        VStack {
            Text("Elevation: \(resort.elevation)m")
            Text("Snow: \(resort.snowDepth)cm")
        }
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetailsView(resort: Resort.example)
    }
}
