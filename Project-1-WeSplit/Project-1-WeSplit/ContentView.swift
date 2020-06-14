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
    @State private var numberOfPeople = "2"
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15 , 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(Int(numberOfPeople) ?? 2) 
        let tipSelection = Double(tipPercentages[tipPercentage])
        let ordenAmount = Double(checkAmount) ?? 0
        
        let tipValue = ordenAmount / 100 * tipSelection
        let granTotal = ordenAmount + tipValue
        let amountPerPerson = granTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalCheckAmount: Double {
        let tipSelecttion = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipDecimal = (tipSelecttion / 100)
        let totalAmount = orderAmount + (orderAmount * tipDecimal)
        
        return totalAmount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of People", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("How much tip do you want to leave")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<self.tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total amount for the check")) {
                    Text("$\(totalCheckAmount, specifier: "%.2f")")
                }
                
                Section(header: Text("Amount per Person")) {
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
