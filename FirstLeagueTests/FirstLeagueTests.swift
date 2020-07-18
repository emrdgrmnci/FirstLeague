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

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLeague() throws {
        let bundle = Bundle(for: FirstLeagueTests.self)
        let url = bundle.url(forResource: "team", withExtension: "json")!
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let league = try decoder.decode(Main.self, from: data)

        XCTAssertEqual(league.teams?.count, 18)
        XCTAssertEqual(league.teams?.first?.rank, "1")
        XCTAssertEqual(league.teams?.first?.team, "Hatayspor")
        XCTAssertEqual(league.teams?.first?.play, "33")
        XCTAssertEqual(league.teams?.first?.goalDistance, "18")
        XCTAssertEqual(league.teams?.first?.point, "63")

    }
}
