//
//  ContentView.swift
//  Project-3-ViewsAndModifiers
//
//  Created by Jonathan Miranda on 6/14/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

struct ContentView: View {
    
    var body: some View {
        GridStack(rows: 4, columns: 4) { (row, col) in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
                .customStyle()
        }
            
    }
}

struct CustomLargeBlue: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
    
}

extension Text {

    func customStyle() -> some View {
        self.modifier(CustomLargeBlue())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
