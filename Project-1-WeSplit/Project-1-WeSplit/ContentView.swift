//
//  ContentView.swift
//  Project-1-WeSplit
//
//  Created by Jonathan Miranda on 6/11/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15 , 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let ordenAmount = Double(checkAmount) ?? 0
        
        let tipValue = ordenAmount / 100 * tipSelection
        let granTotal = ordenAmount + tipValue
        let amountPerPerson = granTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Nuber of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to leave")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<self.tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
