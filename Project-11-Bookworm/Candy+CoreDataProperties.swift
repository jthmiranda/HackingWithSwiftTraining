//
//  Candy+CoreDataProperties.swift
//  Project-11-Bookworm
//
//  Created by Jonathan Miranda on 6/1/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "Unknown name"
    }
}
