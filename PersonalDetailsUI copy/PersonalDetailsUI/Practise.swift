//
//  Practise.swift
//  PersonalDetailsUI
//
//  Created by G Ajay on 13/03/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    let recentCourt: RecentCourt

    @State var snapshotImage: UIImage?

    var body: some View {
        VStack {
            if let image = snapshotImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(8)
            } else {
                ProgressView("Loading map...")
            }
        }
        .onAppear(perform: loadMapSnapshot)
    }

    func loadMapSnapshot() {
        let options = MKMapSnapshotter.Options()
        if let lati = recentCourt.place?.addressDetail?.latitude , let longi = recentCourt.place?.addressDetail?.longitude {
            if let latitude = Double(lati), let longitude = Double(longi) {
                options.region = MKCoordinateRegion(center: CLLocationCoordinate2D(
                    latitude: latitude,longitude: longitude),
                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                options.size = CGSize(width: 268, height: 135)
                
            }
            
        }

        MKMapSnapshotter(options: options).start { snapshot, _ in
            snapshotImage = snapshot?.image
        }
    }
}
#Preview {
    MapView(recentCourt: RecentCourt(id: 1, matchType: "", startTime: "", endTime: "", order: 2, notesForCourt: "", courtShortName: "", courtFullName: "", status: "", place: Place(id: 1, name: "", address: "", contactNumber: "", website: "", distance: "", placeType: "", addressDetail: AddressDetail(id: 1, deliveryLine1: "", lastLine: "", cityName: "", plus4Code: "", primaryNumber: "", stateAbbreviation: "", streetName: "", streetSuffix: "", zipcode: "", congressionalDistrict: "", countyFIPS: "", countyName: "", latitude: "17.284240907932887", longitude: "78.53842239904938", active: true))))
}
