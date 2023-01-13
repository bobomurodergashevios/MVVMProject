//
//  RMEpisode.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 11/01/23.
//

import Foundation

//struct RMEpisode : Codable {
//    let info : Info?
//    let results : [RMEpisodeResults]?
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
//        results = try values.decodeIfPresent([RMEpisodeResults].self, forKey: .results)
//    }
//
//}

struct RMEpisode : Codable {
    let id : Int?
    let name : String?
    let air_date : String?
    let episode : String?
    let characters : [String]?
    let url : String?
    let created : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case air_date = "air_date"
        case episode = "episode"
        case characters = "characters"
        case url = "url"
        case created = "created"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        air_date = try values.decodeIfPresent(String.self, forKey: .air_date)
        episode = try values.decodeIfPresent(String.self, forKey: .episode)
        characters = try values.decodeIfPresent([String].self, forKey: .characters)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        created = try values.decodeIfPresent(String.self, forKey: .created)
    }

}
