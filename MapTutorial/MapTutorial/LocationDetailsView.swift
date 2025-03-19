//
//  LocationDetailsView.swift
//  MapTutorial
//
//  Created by G Ajay on 18/03/25.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
    @Binding var mapSelection: MKMapItem?
    @Binding var show: Bool
    @State var lookAroundScene: MKLookAroundScene?
    @Binding var getDirections: Bool
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(mapSelection?.placemark.name ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(mapSelection?.placemark.title ?? "")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                        .padding(.trailing)
                }
                Spacer()
                Button {
                    show.toggle()
                    mapSelection = nil
                } label: {
                    Image(systemName: "multiply.circle")
                        .resizable()
                        .frame(width: 24 , height: 24)
                }
            }
            if let scene = lookAroundScene {
                LookAroundPreview(initialScene: scene)
                    .frame(height: 200)
                    .cornerRadius(12)
                    .padding()
            } else {
                ContentUnavailableView("No Scene Available", systemImage: "eye.slash")
            }
            HStack {
                Button(action: {
                    if let mapSelection {
                        mapSelection.openInMaps()
                    }
                }, label: {
                    Text("Go to Maps")
                        .font(.headline)
                        .frame(width: 170 , height: 48)
                        .foregroundStyle(.white)
                        .background(.green.gradient)
                        .cornerRadius(12)
                })
                Spacer()
                Button(action: {
                    getDirections = true
                    show = false
                }, label: {
                    Text("Get Directions")
                        .font(.headline)
                        .frame(width: 170 , height: 48)
                        .foregroundStyle(.white)
                        .background(.blue.gradient)
                        .cornerRadius(12)
                })
            }
        }
        .padding()
        .onAppear {
            fetchLookAroundPreview()
        }
        .onChange(of: mapSelection , { oldValue , newValue in
            fetchLookAroundPreview()
        })
    }
}

extension LocationDetailsView {
    func fetchLookAroundPreview() {
        if let mapSelection {
            lookAroundScene = nil
            Task {
                let request = MKLookAroundSceneRequest(mapItem: mapSelection)
                lookAroundScene = try? await request.scene
            }
        }
    }
}

//#Preview {
//    LocationDetailsView()
//}
