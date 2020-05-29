//
//  Movie+CoreDataProperties.swift
//  Project-11-Bookworm
//
//  Created by Jonathan Miranda on 5/28/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

}
