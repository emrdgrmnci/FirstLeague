//
//  ResultViewModel.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 9.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import Foundation

class ResultViewModel {
    weak var delegate: ResultViewModelDelegate?
    private let service: APIServiceProtocol
    var matchs: [Result]

    init(service: APIServiceProtocol) {
        self.service = service
        self.matchs = []
    }
}

extension ResultViewModel: ResultViewModelInterface {
    func matchs(index: Int) -> Result {
        return matchs[index]
    }


    var matchsCount: Int {
        return matchs.count
    }
    
    //    func selectMatchs(at index: Int) {
    //
    //    }

    func loadMatchs() {
        let headers = [
            "Content-Type": "application/json",
            "Authorization": "apikey 6o1ssdxqaWaSLfcgY0STmy:26x2yJ1yPDh1BZxQBMzYI0"
        ]
        let url = URL(string: "https://api.collectapi.com/sport/results?data.league=tff-1-lig")
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        service.getResults(url: request as URLRequest) { [weak self] (matchs) in
            self?.matchs = matchs?.result ?? []
            self?.delegate?.matchsLoaded()
        }
    }

    func viewWillDisappear() {
        delegate?.matchsLoaded()
    }
}
