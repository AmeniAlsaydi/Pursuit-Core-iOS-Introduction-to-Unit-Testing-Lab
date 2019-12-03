//
//  StarWarsTests.swift
//  UnitTestingLabTests
//
//  Created by Amy Alsaydi on 12/3/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import XCTest

@testable import UnitTestingLab

class StarWarsTests: XCTestCase {
    
    // arrange
    let filename = "StarWarsData"
    let ext = "json"

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParseJsonToArray() {
        // arrange
        let expectedEpisodeCount = 7
        
        // act
        let episodes = getEpisodes()
        
        // assert
        XCTAssertEqual(episodes.count, expectedEpisodeCount, "Number of episode should be \(expectedEpisodeCount)")
        
    }
    
    func testForDirector() {
        //arrange
        let expectedDirector = "George Lucas"
        
        // act
        let episodes = getEpisodes()
        let firstEpisode = episodes.first
        
        // assert
        XCTAssertEqual(expectedDirector, firstEpisode?.director)
        
    }
    

}

extension StarWarsTests {
    // helper functions
    
    func getRawData() -> Data {
        return Bundle.readRawJSONData(filename: filename, ext: ext)
    }
    
    func getEpisodes() -> [Episode] {
        let data = getRawData()
        return Episode.getEpisodes(from: data)
    }
    
    
}
