//
//  MainViewControllerBuilder.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 6.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import UIKit

class MainViewControllerBuilder {

    static func create() -> UIViewController {

        // View controller
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let navigationController = storyBoard.instantiateViewController(identifier: "MainNavigationController") as! UINavigationController
        let viewController = navigationController.viewControllers.first as! MainViewController

        // View model
        let viewModel = MainViewModel(service: APIService())
        viewController.viewModel = viewModel
        return viewController
    }
}
