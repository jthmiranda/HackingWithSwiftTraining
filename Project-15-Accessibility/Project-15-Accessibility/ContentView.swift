//
//  ContentView.swift
//  Project-15-Accessibility
//
//  Created by Jonathan Miranda on 2/18/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    @State private var rating = 3
    
    var body: some View {
        Stepper("Rate our service \(rating)/5", value: $rating, in: 1...5)
        .accessibility(value: Text("\(rating) out of 5"))
        
//        Image(pictures[selectedPicture])
//            .resizable()
//            .scaledToFit()
//            .accessibility(label: Text(labels[selectedPicture]))
//            .accessibility(addTraits: .isButton)
//            .accessibility(removeTraits: .isImage)
//            .onTapGesture {
//                self.selectedPicture = Int.random(in: 0...3)
//            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
