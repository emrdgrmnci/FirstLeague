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

    var teams: [Result]

    init(service: APIServiceProtocol) {
        self.service = service
        self.teams = []
    }
}

extension MainViewModel: MainViewModelInterface {

    var teamsCount: Int {
        return teams.count
    }

    func teams(index: Int) -> Result {
        return teams[index]
    }

    func getAllTeams() {
        let headers = [
            "Content-Type": "application/json",
            "Authorization": "apikey 22fD7eXOwaKOcbYj6JN8qN:0Wwv5KWn8NvNbqPHDqlsgr"
        ]

        var request = URLRequest(url: NSURL(string: "https://api.collectapi.com/sport/league?data.league=tff-1-lig")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        service.getTeams(url: request as URLRequest) { [weak self] (teams) in
            self?.teams = teams?.result ?? []
            self?.delegate?.notifyTableView()
        }
    }

    func viewWillDisappear() {
        delegate?.notifyTableView()
    }
}

/*
 extension NewsViewModel: NewsViewModelInterface {
 func selectNews(at index: Int) {
 let newsDetail = news[index]
 let viewModel = NewsDetailViewModel(newsDetail: newsDetail)
 delegate?.navigate(to: .detail(viewModel))
 }

 var newsCount: Int {
 return news.count
 }
 
 func news(index: Int) -> News {
 return news[index]
 }

 func getAllNews() {
 let url = URL(string: "http://newsapi.org/v2/everything?q=corona&sortBy=publishedAt&apiKey=\(apiKey)")!
 service.getNews(url: url) { [weak self] (news) in
 self?.news = news?.news ?? []
 self?.delegate?.notifyTableView()
 }
 }

 func viewWillDisappear() {
 delegate?.notifyTableView()
 }
 }
 */


