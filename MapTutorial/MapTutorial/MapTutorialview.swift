//
//  ContentView.swift
//  MapTutorial
//
//  Created by G Ajay on 18/03/25.
//

import SwiftUI
import MapKit

struct MapTutorialview: View {
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
    @State private var searchPlace = ""
    @State private var results = [MKMapItem]()
    @State private var mapSelection: MKMapItem?
    @State private var showDetails = false
    @State private var getDirections = false
    @State private var routeDisplay = false
    @State private var route: MKRoute?
    @State private var routeDestination: MKMapItem?
    @State private var showSatelliteView = false
    var body: some View {
        Map(position: $cameraPosition , selection: $mapSelection) {
//            Marker("User Location" ,systemImage: "paperplane.fill", coordinate: .userlocation)
//                .tint(.red.gradient)
            Annotation("User location", coordinate: .userlocation) {
                ZStack {
                    Circle()
                        .frame(width: 32 , height: 32)
                        .foregroundStyle(.blue.opacity(0.25))
                    Circle()
                        .frame(width: 20 , height: 20)
                        .foregroundStyle(.white)
                    Circle()
                        .frame(width: 12 , height: 12)
                        .foregroundStyle(.blue)
                }
            }
            ForEach(results, id: \.self) { result in
                if routeDisplay {
                    if result == routeDestination {
                        let placemark = result.placemark
                        Marker(placemark.name ?? "Unknown Location", coordinate: placemark.coordinate)
                    }
                } else {
                    let placemark = result.placemark
                    Marker(placemark.name ?? "Unknown Location", coordinate: placemark.coordinate)
                }
            }
            if let route {
                MapPolyline(route.polyline)
                    .stroke(Color.blue, lineWidth: 8)
            }
        }
        .overlay(alignment: .topLeading) {
            TextField("Search for place", text: $searchPlace)
                .padding(12)
                .background(Color.white)
                .foregroundStyle(.black)
                .frame(width: 300)
                .cornerRadius(12)
                .padding()
            
        }
        .onSubmit(of: .text) {
            Task { await searchPlace() }
        }
        .onChange(of: getDirections, { oldValue , newValue in
            if newValue {
                fetchRoute()
            }
        })
        .onChange(of: mapSelection, { oldValue, newValue in
            showDetails = newValue != nil
        })
        .sheet(isPresented: $showDetails) {
            LocationDetailsView(mapSelection: $mapSelection,
                                show: $showDetails,
                                getDirections: $getDirections)
                .presentationDetents([.height(340)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(340)))
                .presentationCornerRadius(12)
        }
        
        .mapControls {
            MapCompass()
            MapPitchToggle()
        }
    }
}

extension MapTutorialview {
    func searchPlace() async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchPlace
        request.region = .userRegion
        let results = try? await MKLocalSearch(request: request).start()
        self.results = results?.mapItems ?? []
    }
    
    func fetchRoute() {
        if let mapSelection {
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: .init(coordinate: .userlocation))
            request.destination = mapSelection
            
            Task {
                let result = try? await MKDirections(request: request).calculate()
                route = result?.routes.first
                routeDestination = mapSelection
                
                withAnimation(.snappy) {
                    routeDisplay = true
                    showDetails = false
                    if let rect = route?.polyline.boundingMapRect , routeDisplay {
                        cameraPosition = .rect(rect)
                    }
                }
            }
        }
    }
}

extension CLLocationCoordinate2D {
    static var userlocation: CLLocationCoordinate2D {
        return .init(latitude: 17.44158997920632, longitude: 78.38244985825938)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .userlocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
    }
}

#Preview {
    MapTutorialview()
}
