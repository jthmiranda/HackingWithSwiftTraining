//
//  MapView.swift
//  Project-14-BucketList
//
//  Created by Jonathan Miranda on 2/15/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
