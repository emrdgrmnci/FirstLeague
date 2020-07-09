//
//  DetailViewController.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 9.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
var detailViewModel: DetailViewModelInterface!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewModel.delegate = self
        detailViewModel.load()
    }
}

extension DetailViewController: DetailViewModelDelegate {
    func prepareDetailViewInfos(_ presentation: DetailPresentation) {
        title = presentation.teamsName
    }
}
