//
//  Result.swift
//  Project-14-BucketList
//
//  Created by Jonathan Miranda on 2/17/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
