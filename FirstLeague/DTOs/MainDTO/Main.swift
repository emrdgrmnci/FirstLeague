//
//  Main.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 6.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import Foundation

// MARK: - Main
struct Main : Codable {
    let teams : [Team]?
    let success : Bool?

    enum CodingKeys: String, CodingKey {
        case teams = "result"
        case success = "success"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        teams = try values.decodeIfPresent([Team].self, forKey: .teams)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
    }
}
