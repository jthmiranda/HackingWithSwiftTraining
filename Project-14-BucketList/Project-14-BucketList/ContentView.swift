//
//  ContentView.swift
//  Project-14-BucketList
//
//  Created by Jonathan Miranda on 2/14/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import MapKit
import SwiftUI
import LocalAuthentication


struct ContentView: View {
  
    @State private var isUnlock = false
    @State private var showingErrorAuthAlert = false
   
    var body: some View {
        VStack {
            if isUnlock {
                MapViewContent()
            } else {
                 Button("Show Places") {
                    self.authenticate()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .alert(isPresented: $showingErrorAuthAlert) {
                    Alert(title: Text("Not Authenticated"), message: Text("Please try again"), dismissButton: .default(Text("OK")))
                }
            }
            
        }
    }
        
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data using touch ID"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success , authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlock = true
                    } else {
                        self.showingErrorAuthAlert = true
                    }
                }
            }
        } else {
            // no biometry
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
