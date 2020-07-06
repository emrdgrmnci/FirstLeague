//
//  MainContracts.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 6.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import Foundation

protocol MainViewModelInterface: class {
    var delegate: MainViewModelDelegate? { get set }
    var teamsCount: Int { get }

    func team(index: Int) -> Result
    func getAllTeams()

    func viewWillDisappear()
}

protocol MainViewModelDelegate: class {
    func notifyTableView()
}
