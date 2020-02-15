//
//  ContentView.swift
//  Project-14-BucketList
//
//  Created by Jonathan Miranda on 2/14/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                let str = "Test Message"
                let url =
                    self.getDocumentsDirectory().appendingPathComponent("message.txt")
                
                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
