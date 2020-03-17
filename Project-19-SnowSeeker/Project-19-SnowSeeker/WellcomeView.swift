//
//  WellcomeView.swift
//  Project-19-SnowSeeker
//
//  Created by Jonathan Miranda on 3/16/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct WellcomeView: View {
    var body: some View {
        VStack {
            Text("Wellcome to SnowSeeker!")
                .font(.largeTitle)
            Text("Please select a resort fom the left-hand menu; swipe from the left edge to show it.")
                .foregroundColor(.secondary)
        }
    }
}

struct WellcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WellcomeView()
    }
}
