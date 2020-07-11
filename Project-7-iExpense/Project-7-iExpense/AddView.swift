//
//  AddView.swift
//  Project-7-iExpense
//
//  Created by Jonathan Miranda on 7/10/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = ""
    @State private var amount = ""
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Types", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text("\($0)")
                    }
                }
                
                TextField("Amount", text: $amount)
            }
        .navigationBarTitle("Add new expense")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
