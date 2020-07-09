//
//  ResultViewController.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 9.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import UIKit
import SnapKit

class ResultViewController: UIViewController {

    var tableView = UITableView()

    var viewModel: ResultViewModelInterface! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SONUÇLAR"

        view.addSubview(tableView)

        tableView.dataSource = self
        tableView.delegate = self

        makeTableViewUI()

        viewModel.loadMatchs()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    func makeTableViewUI() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 70
        tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: "ResultTableViewCell")
        tableView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(view)
        }
    }
}

extension ResultViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        viewModel.selectTeams(at: indexPath.row)
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension ResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.matchsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ResultTableViewCell else {
            fatalError("ResultTableViewCell not found")
        }
        let match = viewModel.matchs(index: indexPath.row)
        cell.configure(with: match)
        return cell
    }
}

extension ResultViewController: ResultViewModelDelegate {

//    func navigate(to route: ResultsViewRoute) {
//        switch route {
//        case .detail(let viewModel):
//            let detailViewController = DetailControllerBuilder.make(with: viewModel)
//            detailViewController.modalPresentationStyle = .fullScreen
//            navigationController?.pushViewController(detailViewController, animated: true)
//        }
//    }

    func matchsLoaded() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
