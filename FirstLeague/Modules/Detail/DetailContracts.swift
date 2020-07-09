//
//  DetailContracts.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 9.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import Foundation

protocol DetailViewModelDelegate: class {
     func prepareDetailViewInfos(_ presentation: DetailPresentation)
}

protocol DetailViewModelInterface: class {
    var delegate: DetailViewModelDelegate? { get set }
    func load()
}
