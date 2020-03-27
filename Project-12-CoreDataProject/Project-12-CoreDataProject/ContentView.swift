//
//  ContentView.swift
//  Project-12-CoreDataProject
//
//  Created by Jonathan Miranda on 3/25/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct Student: Hashable {
    var name: String
}

struct ContentView: View {
    let students = [Student(name: "Harry"), Student(name: "Logan")]
    
    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
