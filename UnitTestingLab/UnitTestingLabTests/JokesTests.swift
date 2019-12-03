//
//  UnitTestingLabTests.swift
//  UnitTestingLabTests
//
//  Created by Amy Alsaydi on 12/2/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import XCTest
@testable import UnitTestingLab

class JokesTests: XCTestCase {
    // arrange
    let filename = "JokesData"
    let ext = "json"
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testingReadingDataFromJokesFile() {
        //arrange above
     
        // act
        let data = getRawData()

        // assert
         XCTAssertNotNil(data)
        
    }
    
    func testParseJSONToJokesArray() {
        // arrange
       
        // act
        let jokes = getJokes()
        
        // asserts
        XCTAssertGreaterThan(jokes.count, 0, "jokes should be greater than 0")

    }
    func testFirstJoke() {
        // arrange
        let jokes = getJokes()
        
        //act
        let firstJoke = jokes.first!
        
        // assert
    XCTAssertTrue(firstJoke.setup.contains("To understand what"), "first joke doesnt match")
        
    }

}


extension JokesTests {
    func getRawData() -> Data {
        return Bundle.readRawJSONData(filename: filename, ext: ext)
    }
    
    func getJokes() -> [Joke] {
        let data = getRawData()
        return Joke.getJokes(from: data)
    }
}
