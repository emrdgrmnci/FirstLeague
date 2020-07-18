//
//  Result.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 6.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import Foundation


// MARK: - Result
struct Team : Codable {
    let rank : String?
    let draw        : String?
    let lose        : String?
    let win         : String?
    let play        : String?
    let point       : String?
    let goalFor     : String?
    let goalAgainst : String?
    let goalDistance: String?
    let team        : String?

    enum CodingKeys: String, CodingKey {
        case rank = "rank"
        case draw = "draw"
        case lose = "lose"
        case win = "win"
        case play = "play"
        case point = "point"
        case goalFor = "goalfor"
        case goalAgainst = "goalagainst"
        case goalDistance = "goaldistance"
        case team = "team"
    }

//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        rank = try values.decodeIfPresent(String.self, forKey: .rank)
//        draw         = try values.decodeIfPresent(String.self, forKey: .draw)
//        lose         = try values.decodeIfPresent(String.self, forKey: .lose)
//        win          = try values.decodeIfPresent(String.self, forKey: .win)
//        play         = try values.decodeIfPresent(String.self, forKey: .play)
//        point        = try values.decodeIfPresent(String.self, forKey: .point)
//        goalFor      = try values.decodeIfPresent(String.self, forKey: .goalFor)
//        goalAgainst  = try values.decodeIfPresent(String.self, forKey: .goalAgainst)
//        goalDistance = try values.decodeIfPresent(String.self, forKey: .goalDistance)
//        team         = try values.decodeIfPresent(String.self, forKey: .team)
//    }
}
