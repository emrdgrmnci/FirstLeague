//
//  DetailViewController.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 9.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    var detailViewModel: DetailViewModelInterface!
    var team = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewModel.delegate = self
        detailViewModel.load()

        view.addSubview(team)

        team.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 10, left: 120, bottom: 10, right: 0))
        }

        team.textAlignment = NSTextAlignment.left
        team.font = UIFont.systemFont(ofSize: 25)
    }
}

extension DetailViewController: DetailViewModelDelegate {
    func prepareDetailViewInfos(_ presentation: DetailPresentation) {
        team.text = presentation.teamsName
    }
}
