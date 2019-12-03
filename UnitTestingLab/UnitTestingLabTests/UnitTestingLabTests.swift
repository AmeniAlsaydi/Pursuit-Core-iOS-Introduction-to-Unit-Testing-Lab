//
//  UnitTestingLabTests.swift
//  UnitTestingLabTests
//
//  Created by Amy Alsaydi on 12/2/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import XCTest
@testable import UnitTestingLab

class UnitTestingLabTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testingReadingDataFromJokesFile() {
        //arrange
        let filename = "JokesData"
        let ext = "json"
        
        // act
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)

        // assert
         XCTAssertNotNil(data)
        
    }
    
    func testParseJSONToJokesArray() {
        // arrange
        let filename = "JokesData"
        let ext = "json"
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        
        // act
        let jokes = Joke.getJokes(from: data)
        
        // asserts
        XCTAssertGreaterThan(jokes.count, 0, "jokes should be greater than 0")

    }
    func testFirstJoke() {
        // arrange
        let filename = "JokesData"
        let ext = "json"
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        let jokes = Joke.getJokes(from: data)
        
        //act
        let firstJoke = jokes.first!
        
        // assert
    XCTAssertTrue(firstJoke.setup.contains("To understand what"), "first joke doesnt match")
        
    }

}
