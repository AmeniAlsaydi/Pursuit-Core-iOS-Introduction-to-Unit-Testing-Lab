//
//  TriviaTests.swift
//  UnitTestingLabTests
//
//  Created by Amy Alsaydi on 12/3/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import XCTest

@testable import UnitTestingLab

class TriviaTests: XCTestCase {
    
    // arrange
    let filename = "TriviaData"
    let ext = "json"

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testParseJSONToTriviaArray() {
        //act
        let triviaQuestions = getQuestions()
        
        //assert
        XCTAssertGreaterThan(triviaQuestions.count, 0, "Questions should be greater than 0")
    }
    
    func testFirstTriviaAnswer() {
        // arrange
        let triviaQuestions = getQuestions()
        
        // act
        let firstTriviaQuestion = triviaQuestions.first!
        let expectedAnswer = "Revolver"
        
        //assert
        XCTAssertEqual(firstTriviaQuestion.correct_answer, expectedAnswer, "correct answer is \(expectedAnswer)")
        
    }

}

extension TriviaTests {
    
    func getRawData() -> Data {
        return Bundle.readRawJSONData(filename: filename, ext: ext)
    }
    func getQuestions() -> [TriviaQuestion] {
        let data = getRawData()
        return TriviaQuestion.getTrivia(from: data)
    }
}
