//
//  ContentView.swift
//  Project-7-iExpense
//
//  Created by Jonathan Miranda on 7/5/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct ExperseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExperseItem]()
}

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems(at:))
            }
            .navigationBarTitle("iExpenses")
            .navigationBarItems(leading: EditButton(),trailing:
                Button(action: {
                    self.showingAddExpense.toggle()
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: self.expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
