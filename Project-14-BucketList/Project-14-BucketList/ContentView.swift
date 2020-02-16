//
//  ContentView.swift
//  Project-14-BucketList
//
//  Created by Jonathan Miranda on 2/14/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import LocalAuthentication
import SwiftUI


struct ContentView: View {
    @State private var isUnlock = false
   
    var body: some View {
        VStack {
            if self.isUnlock {
                Text("Unlock")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, autheticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlock = true
                    } else {
                        // there was a problem
                    }
                }
            }
        } else {
            // no biometrics
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
