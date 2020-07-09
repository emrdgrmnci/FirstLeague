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
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectTeams(at: indexPath.row)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "O     A     P"
    }


    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.font = .systemFont(ofSize: 13)
        header.textLabel?.textAlignment = .right
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
