//
//  DetailViewModel.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 9.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import Foundation

class DetailViewModel: DetailViewModelInterface {
    weak var delegate: DetailViewModelDelegate?
    private let presentation: DetailPresentation

    func load() {
        delegate?.prepareDetailViewInfos(presentation)
    }

    init(teamsDetail: Team) {
        self.presentation = DetailPresentation(teams: teamsDetail)
    }
}
