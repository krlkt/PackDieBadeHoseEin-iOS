//
//  LocationView.swift
//  Pack die Badehose ein
//
//  Created by Karel Karunia on 19.07.21.
//

import SwiftUI
import CoreLocation

struct LocationView: View {
    let bathingArea: BathingArea
    var body: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: bathingArea.geometry.coordinates[1], longitude: bathingArea.geometry.coordinates[0]))
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(bathingArea: BathingArea(type: "featured", geometry: Geometry(type: "point", coordinates: [13.52 , 52.5]), properties: Property(title: "title", href: "href", description: "description", ids: "id", datas: Datas(ids: "id", prognoselink: "prglink", farbe: "farbe", badestellelink: "badestellelink", badname: "badname", bezirk: "gebiet", dat: "datum", eco: "eco", ente: "ente", sicht: "sicht", temp: "24,4", profillink: "profillink", pdflink: "pdflink", dat_predict: "dat_predict"))))
    }
}
