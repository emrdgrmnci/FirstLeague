//
//  FirstLeagueTests.swift
//  FirstLeagueTests
//
//  Created by Emre Değirmenci on 13.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import XCTest
@testable import FirstLeague

class FirstLeagueTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testRetrieveTeams() {
        let main = Main(result: [], success: <#T##Bool?#>)
        let team = Team(from: <#Decoder#>)
//        let school = School(students: [])
//        school.retrieveAlumni { result in
//            switch result {
//            case .success(let alumni):
//                XCTAssertEqual(alumni.count, 2)
//            case .failure:
//                XCTFail()
//            }
//        }
    }
}
