//
//  ContentView.swift
//  Project-11-Bookworm
//
//  Created by Jonathan Miranda on 5/27/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(), sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            Text("Count \(books.count)")
                .navigationBarTitle("Bookworm")
                .navigationBarItems(trailing:
                    Button(action: {
                        self.showingAddScreen.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                )
                .sheet(isPresented: $showingAddScreen) {
                    AddViewBook().environment(\.managedObjectContext, self.moc)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
