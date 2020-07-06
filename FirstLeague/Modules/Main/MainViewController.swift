//
//  ViewController.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 6.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    var viewModel: MainViewModelInterface! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.mainTableView.reloadData()
        }

        viewModel.getAllTeams()
    }

    override func viewWillAppear(_ animated: Bool) {
        mainTableView.reloadData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        viewModel.viewWillDisappear()
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.teamsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell else {
            fatalError("MainTableViewCell not found")
        }

        let team = viewModel.team(index: indexPath.row)
        cell.configure(with: team)

        return cell

    }
}

extension MainViewController: MainViewModelDelegate {
    func notifyTableView() {
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
    }
}
