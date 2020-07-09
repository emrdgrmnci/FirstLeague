//
//  DetailPresentation.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 9.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import Foundation

struct DetailPresentation {
    let teamsName: String

    init(teams: Result) {
        teamsName = teams.team ?? "ALTAY"
    }
}
