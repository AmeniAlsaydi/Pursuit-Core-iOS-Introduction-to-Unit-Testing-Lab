//
//  JokesModel.swift
//  UnitTestingLab
//
//  Created by Amy Alsaydi on 12/2/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import Foundation

struct Joke: Codable {
    let setup: String
    let punchline: String
    
    static func getJokes(from data: Data) -> [Joke] {
        var jokes = [Joke]()
        
        do {
            let jokesData = try JSONDecoder().decode([Joke].self, from: data)
            jokes = jokesData
            } catch {
                fatalError("decoding error:\(error)")
            }
    
        
        return jokes
    }

}

