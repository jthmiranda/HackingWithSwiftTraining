//
//  Candy+CoreDataProperties.swift
//  Project-12-CoreDataProject
//
//  Created by Jonathan Miranda on 4/4/20.
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
        name ?? "Unknown Candy"
    }

}
