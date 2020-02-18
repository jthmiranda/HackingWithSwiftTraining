//
//  MapViewContent.swift
//  Project-14-BucketList
//
//  Created by Jonathan Miranda on 2/17/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI
import MapKit

struct MapViewContent: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
     @State private var locations = [CodableMKPointAnnotation]()
     @State private var selectedPlace: MKPointAnnotation?
     @State private var showingPlaceDetails = false
     @State private var showingEditingScreen = false
     @State private var isUnlock = false
    
     var body: some View {
        ZStack {
            
            MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        let newLocation = CodableMKPointAnnotation()
                        newLocation.title = "Example Location"
                        newLocation.coordinate = self.centerCoordinate
                        self.locations.append(newLocation)
                        
                        self.selectedPlace = newLocation
                        self.showingEditingScreen = true
                    }) {
                        Image(systemName: "plus")
                            .padding()
                            .background(Color.black.opacity(0.75))
                            .foregroundColor(.white)
                            .font(.title)
                            .clipShape(Circle())
                            .padding(.trailing)
                    }
                }
            }
            
        }
         .alert(isPresented: $showingPlaceDetails) {
             Alert(title: Text(selectedPlace?.title ?? "Unknow"), message: Text(selectedPlace?.subtitle ?? "Missing place information"), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
                     self.showingEditingScreen = true
                 }
             )
         }
         .sheet(isPresented: $showingEditingScreen, onDismiss: saveData) {
             if self.selectedPlace != nil  {
                 EditView(placemark: self.selectedPlace!)
             }
         }
         .onAppear(perform: loadData)
     }
     
     func getDocumentsDirectory() -> URL {
         let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
         return paths[0]
     }
     
     func loadData() {
         let fileName = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
         
         do  {
             let data = try Data(contentsOf: fileName)
             locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
         } catch {
             print("Unable to load saved data.")
         }
     }
     
     func saveData() {
         do {
             let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
             let data = try JSONEncoder().encode(self.locations)
             try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
         } catch {
             print("Unable to save data.")
         }
     }
}

struct MapViewContent_Previews: PreviewProvider {
    static var previews: some View {
        MapViewContent()
    }
}
