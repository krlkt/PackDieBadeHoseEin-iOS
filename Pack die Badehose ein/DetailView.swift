//
//  DetailView.swift
//  Pack die Badehose ein
//
//  Created by Karel Karunia on 18.07.21.
//

import SwiftUI

struct DetailView: View {
    let bathingArea: BathingArea
    
    //Da die Anforderung nicht sagt, wie detailiert musst die Informationen jeder Badestelle sein, lasse ich nur einpaar Informationen anzeigen, um die Sauberkeit auf dem View zu halten. Ich kann mehr anzeigen, viele der Informationen finde ich aber unwichtig oder zu lang
    var body: some View {
        VStack{
            Image("Badestelle")
                .resizable()
                .frame(width: 180, height: 180, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 5), alignment: .center)
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
            Text("Title: \(bathingArea.properties.title)").padding(.top)
            Text("Area: \(bathingArea.properties.datas.bezirk)")
            Text("Temperature: \(bathingArea.properties.datas.temp)")
            Text("Test Date: \(bathingArea.properties.datas.dat)")
            Text("Geometry type: \(bathingArea.geometry.type)")
            Text("X-Coordinate: \(bathingArea.geometry.coordinates[0])")
            Text("Y-Coordinate: \(bathingArea.geometry.coordinates[1])")
            let link = "https://berlin.de\(bathingArea.properties.href)"
            Link("Click here for details", destination:URL(string: link)!).padding()
            NavigationLink(
                destination: LocationView(bathingArea: bathingArea),
                label: {
                    Text("View on map")
                }).padding(.bottom)
        }
        .font(.system(size: 16, weight: .regular, design: .rounded))
        .navigationTitle(bathingArea.properties.datas.badname).navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(bathingArea: BathingArea(type: "featured", geometry: Geometry(type: "point", coordinates: [13.0 , 23.0]), properties: Property(title: "title", href: "href", description: "description", ids: "id", datas: Datas(ids: "id", prognoselink: "prglink", farbe: "farbe", badestellelink: "badestellelink", badname: "badname", bezirk: "gebiet", dat: "datum", eco: "eco", ente: "ente", sicht: "sicht", temp: "24,4", profillink: "profillink", pdflink: "pdflink", dat_predict: "dat_predict"))))
    }
}
