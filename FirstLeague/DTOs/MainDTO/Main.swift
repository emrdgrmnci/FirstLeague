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
    let result : [Team]?
    let success : Bool?

    enum CodingKeys: String, CodingKey {
        case result = "result"
        case success = "success"
    }
}
