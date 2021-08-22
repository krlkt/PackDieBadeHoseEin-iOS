//
//  BathingArea.swift
//  Pack die Badehose ein
//
//  Created by Karel Karunia on 18.07.21.
//

import Foundation

func bathingareaFromJSON(_ jsonFile: String?) -> [BathingArea]? {
    guard let jsonFilePath = jsonFile else { return nil }
    guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonFilePath)) else { return nil }
    let jsonDecoder = JSONDecoder()
    print(jsonData)
    var bathingArea = [BathingArea]()
    do {
        bathingArea = try jsonDecoder.decode([BathingArea].self, from: jsonData)
    } catch {
        print(error)
    }
    return bathingArea
}

struct BathingArea: Codable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case geometry = "geometry"
        case properties = "properties"
    }
    
    let id = UUID()
    let type: String
    let geometry: Geometry
    let properties: Property
}

struct Geometry: Codable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case coordinates = "coordinates"
    }
    
    let id = UUID()
    let type: String
    let coordinates: [Double]
}

struct Property: Codable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case href = "href"
        case description = "description"
        case ids = "id"
        case datas = "data"
    }
    
    let id = UUID()
    let title: String
    let href: String
    let description: String
    let ids: String
    let datas: Datas
}

struct Datas: Codable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case ids = "id"
        case prognoselink = "prognoselink"
        case farbe = "farbe"
        case badestellelink = "badestellelink"
        case badname = "badname"
        case bezirk = "bezirk"
        case dat = "dat"
        case eco = "eco"
        case ente = "ente"
        case sicht = "sicht"
        case temp = "temp"
        case profillink = "profillink"
        case pdflink = "pdflink"
        case dat_predict = "dat_predict"
    }
    
    let id = UUID()
    let ids: String
    let prognoselink: String
    let farbe: String
    let badestellelink: String
    let badname: String
    let bezirk: String
    let dat: String
    let eco: String
    let ente: String
    let sicht: String
    let temp: String
    let profillink: String
    let pdflink: String
    let dat_predict: String
}
