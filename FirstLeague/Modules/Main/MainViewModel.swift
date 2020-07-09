//
//  MainViewModel.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 6.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import Foundation

class MainViewModel {
    weak var delegate: MainViewModelDelegate?
    private let service: APIServiceProtocol
    var teams: [Team]
    
    init(service: APIServiceProtocol) {
        self.service = service
        self.teams = []
    }
}

extension MainViewModel: MainViewModelInterface {
    func selectTeams(at index: Int) {
      let teamsDetail = teams[index]
        let viewModel = DetailViewModel(teamsDetail: teamsDetail)
         delegate?.navigate(to: .detail(viewModel))
    }

    var teamsCount: Int {
        return teams.count
    }
    
    func teams(index: Int) -> Team {
        return teams[index]
    }
    
    func loadTeams() {
        let headers = [
            "Content-Type": "application/json",
            "Authorization": "apikey 6o1ssdxqaWaSLfcgY0STmy:26x2yJ1yPDh1BZxQBMzYI0"
        ]
        let url = URL(string: "https://api.collectapi.com/sport/league?data.league=tff-1-lig")
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        service.getTeams(url: request as URLRequest) { [weak self] (teams) in
            self?.teams = teams?.result ?? []
            self?.delegate?.teamsLoaded()
        }
    }
    
    func viewWillDisappear() {
        delegate?.teamsLoaded()
    }
}
