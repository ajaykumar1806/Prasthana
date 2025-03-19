//
//  MapView.swift
//  MapTutorial
//
//  Created by G Ajay on 18/03/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    var mapViewModel = MapViewModel()
    var body: some View {
    mapViewModel.fetchLocationImage(latitude: 17.44168845825922, longitude: 78.38251286381498)
            .frame(height: 200)
            .cornerRadius(12)
            .padding()
    }
}

@Observable class MapViewModel {
    func fetchLocationImage(latitude: Double, longitude: Double) -> some View {
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
            span: .init(latitudeDelta: 0.03, longitudeDelta: 0.03)
        )
        return Map(coordinateRegion: .constant(region) , interactionModes: [])
            .onTapGesture {
                self.openInAppleMaps(latitude: latitude, longitude: longitude)
            }
    }
    
    func openInAppleMaps(latitude: Double, longitude: Double) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let placeMark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placeMark)
        mapItem.name = "Given Location"
        mapItem.openInMaps()
    }
    
}

#Preview {
    MapView()
}
