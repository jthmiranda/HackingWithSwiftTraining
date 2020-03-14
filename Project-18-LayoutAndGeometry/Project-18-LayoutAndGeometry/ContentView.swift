//
//  ContentView.swift
//  Project-18-LayoutAndGeometry
//
//  Created by Jonathan Miranda on 3/14/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        HStack(alignment: .lastTextBaseline) {
//            Text("Live")
//                .font(.caption)
//            Text("long")
//            Text("and")
//                .font(.title)
//            Text("prosper")
//                .font(.largeTitle)
//        }
        
        
//        VStack(alignment: .leading) {
//            Text("Hello, world!")
//                .alignmentGuide(.leading) { d in d[.trailing] }
//            Text("This is a longer line of text")
//        }
//        .background(Color.red)
//        .frame(width: 400, height: 400)
//        .background(Color.blue)
        
        VStack(alignment: .leading) {
            ForEach(0..<100) { position in
                Text("Numbe \(position)")
                    .alignmentGuide(.leading) { _ in CGFloat(position)}
            }
        }
        .background(Color.red)
        .frame(width: 400, height: 400)
        .background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
