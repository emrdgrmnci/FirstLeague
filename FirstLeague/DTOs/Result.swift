//
//  Result.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 6.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import Foundation

// MARK: - Result
struct Result: Codable {
    let rank: String?
    let draw: String?
    let lose: String?
    let win: String?
    let play: String?
    let point: String?
    let goalfor: String?
    let goalagainst: String?
    let goaldistance: String?
    let team: String?
    
    enum CodingKeys: String, CodingKey {
        case rank
        case draw
        case lose
        case win
        case play
        case point
        case goalfor
        case goalagainst
        case goaldistance
        case team
    }
}
