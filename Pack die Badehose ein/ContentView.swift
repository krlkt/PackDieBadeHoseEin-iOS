//
//  ContentView.swift
//  Pack die Badehose ein
//
//  Created by Karel Karunia on 18.07.21.
//

import SwiftUI

struct ContentView: View {
    let bathingAreas = bathingareaFromJSON(Bundle.main.path(forResource: "BathingAreas", ofType: "json"))
    var body: some View {
        NavigationView {
            List {
                ForEach(bathingAreas!) { bathAreas in
                    NavigationLink(destination: DetailView(bathingArea: bathAreas)){
                        Text(bathAreas.properties.datas.badname)
                    }
                }
            }.navigationTitle("Badestelle-Liste")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
