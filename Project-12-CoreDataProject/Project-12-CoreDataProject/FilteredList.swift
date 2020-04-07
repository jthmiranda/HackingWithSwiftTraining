//
//  FilteredList.swift
//  Project-12-CoreDataProject
//
//  Created by Jonathan Miranda on 4/3/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI
import CoreData

enum CustomPredicate: String {
    case beginsWith = "BEGINSWITH"
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> { fetchRequest.wrappedValue }
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterValue: String, sortDescriptors: [NSSortDescriptor] = [], predicate: CustomPredicate, @ViewBuilder content: @escaping (T) -> Content ) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(predicate) %@", filterKey, filterValue))
        self.content = content
    }
}

