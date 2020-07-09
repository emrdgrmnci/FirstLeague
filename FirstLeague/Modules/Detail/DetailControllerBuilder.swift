//
//  DetailControllerBuilder.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 9.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import UIKit

final class DetailControllerBuilder {

    static func make(with viewModel: DetailViewModelInterface) -> DetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        viewController.detailViewModel = viewModel
        return viewController
    }
}
