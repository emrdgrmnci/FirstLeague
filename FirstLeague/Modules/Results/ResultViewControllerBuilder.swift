//
//  ResultViewControllerBuilder.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 9.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import UIKit

class ResultViewControllerBuilder {
    static func make() -> ResultViewController {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewController(identifier: "ResultViewController") as! ResultViewController
        let service = APIService()
        let viewModel = ResultViewModel(service: service)
        view.viewModel = viewModel
        return view
    }
}


