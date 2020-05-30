//
//  FilteredList.swift
//  Project-11-Bookworm
//
//  Created by Jonathan Miranda on 5/30/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//
import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchedRequest: FetchRequest<T>
    var singers: FetchedResults<T> { fetchedRequest.wrappedValue }
    let content: (T) -> Content
    
    var body: some View {
        List(singers, id:\.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchedRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}

