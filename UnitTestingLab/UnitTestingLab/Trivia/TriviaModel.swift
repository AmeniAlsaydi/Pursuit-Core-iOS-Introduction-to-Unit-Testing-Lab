//
//  TriviaModel.swift
//  UnitTestingLab
//
//  Created by Amy Alsaydi on 12/3/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import Foundation

struct Trivia: Codable {
    let results: [TriviaQuestion]
}

struct TriviaQuestion: Codable {
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}

extension TriviaQuestion {
   static func getTrivia(from data: Data) -> [TriviaQuestion] {
       var questions = [TriviaQuestion]()
    
    do {
        let triviaData = try JSONDecoder().decode(Trivia.self, from: data)
        questions = triviaData.results
    } catch {
         fatalError("decoding error:\(error)") // returns nil
    }
    return questions
   }
    
}
