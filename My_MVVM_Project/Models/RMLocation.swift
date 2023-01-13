//
//  RMLocation.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 11/01/23.
//

import UIKit
//struct RMlocation : Codable {
//    let info : Info?
//    let results : [RMLocResults]?
//
//    enum CodingKeys: String, CodingKey {
//
//        case info = "info"
//        case results = "results"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        info = try values.decodeIfPresent(Info.self, forKey: .info)
//        results = try values.decodeIfPresent([RMLocResults].self, forKey: .results)
//    }
//
//}

struct RMlocation : Codable {
    let id : Int?
    let name : String?
    let type : String?
    let dimension : String?
    let residents : [String]?
    let url : String?
    let created : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case type = "type"
        case dimension = "dimension"
        case residents = "residents"
        case url = "url"
        case created = "created"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        dimension = try values.decodeIfPresent(String.self, forKey: .dimension)
        residents = try values.decodeIfPresent([String].self, forKey: .residents)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        created = try values.decodeIfPresent(String.self, forKey: .created)
    }

}
