//
//  ViewController.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 6.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    let playedTitleLabel    = UILabel()
    let averageTitleLabel   = UILabel()
    let pointTitleLabel     = UILabel()

    var tableView = UITableView()

    var viewModel: MainViewModelInterface! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "TFF 1. LİG"

        view.addSubview(tableView)

        tableView.dataSource = self
        tableView.delegate = self

        makeTableViewUI()

        view.addSubview(playedTitleLabel)
        view.addSubview(averageTitleLabel)
        view.addSubview(pointTitleLabel)

         makeLabelUI()

        viewModel.loadTeams()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    func makeTableViewUI() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 70
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        tableView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(view)
        }
    }

    func makeLabelUI() {
        playedTitleLabel.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 10, left: 320, bottom: 10, right: 0))
        }
        playedTitleLabel.textAlignment = NSTextAlignment.left
        playedTitleLabel.font = UIFont.systemFont(ofSize: 25)
        playedTitleLabel.backgroundColor = .black
        averageTitleLabel.textAlignment = NSTextAlignment.left
        averageTitleLabel.font = UIFont.systemFont(ofSize: 25)
        pointTitleLabel.textAlignment = NSTextAlignment.left
        pointTitleLabel.font = UIFont.systemFont(ofSize: 25)
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectTeams(at: indexPath.row)
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
        let team = viewModel.teams(index: indexPath.row)
        cell.configure(with: team)
        return cell
    }
}

extension MainViewController: MainViewModelDelegate {
    func navigate(to route: TeamsViewRoute) {
        switch route {
        case .detail(let viewModel):
            let detailViewController = DetailControllerBuilder.make(with: viewModel)
            detailViewController.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    func teamsLoaded() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
