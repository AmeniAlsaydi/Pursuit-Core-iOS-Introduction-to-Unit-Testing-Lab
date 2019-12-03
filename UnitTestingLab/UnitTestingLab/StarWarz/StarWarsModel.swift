//
//  StarWarsModel.swift
//  UnitTestingLab
//
//  Created by Amy Alsaydi on 12/2/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import Foundation

struct StarWarsEpisode: Codable {
    let results: [Episode]
}

struct Episode: Codable {
    let title: String
    let openingCrawl: String
    

    private enum CodingKeys: String, CodingKey {
        case title
        case openingCrawl = "opening_crawl"
    }
}


extension Episode {
    static func getEpisodes(from data: Data) -> [Episode] {
        var episodes = [Episode]()
        
        do {
            let episodeData = try JSONDecoder().decode(StarWarsEpisode.self, from: data)
            episodes = episodeData.results
        } catch {
            fatalError("decoding error:\(error)") // returns nil
        }
        return episodes
    }
}
