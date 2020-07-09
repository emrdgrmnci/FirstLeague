//
//  ResultContracts.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 9.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import Foundation

protocol ResultViewModelInterface: class {
    var delegate: ResultViewModelDelegate? { get set }
    var matchsCount: Int { get }
    func matchs(index: Int) -> Result
//    func selectMatchs(at index: Int)
    func loadMatchs()

}

protocol ResultViewModelDelegate: class {
    func matchsLoaded()
//     func navigate(to route: ResultsViewRoute)
}

enum ResultsViewRoute {
    case detail(DetailViewModelInterface)
}
