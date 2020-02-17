//
//  MKPointAnnotation-ObservableObject.swift
//  Project-14-BucketList
//
//  Created by Jonathan Miranda on 2/16/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }
        
        set {
            title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }
        
        set {
            subtitle = newValue
        }
    }
}
