//
//  APIService.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 6.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import Foundation

protocol APIServiceProtocol {
    func getTeams(url: URLRequest, completion: @escaping CallBack<Main?>)
    func getResults(url: URLRequest, completion: @escaping CallBack<MatchResult?>)
}

class APIService: APIServiceProtocol {
    func getTeams(url: URLRequest, completion: @escaping CallBack<Main?>) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data {
                let mainList = try? JSONDecoder().decode(Main.self, from: data)
                if let mainList = mainList {
                    print(mainList)
                    completion(mainList)
                }
            }
        }.resume()
    }
    
    func getResults(url: URLRequest, completion: @escaping CallBack<MatchResult?>) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data {
                let matchList = try? JSONDecoder().decode(MatchResult.self, from: data)
                if let matchList = matchList {
                    print(matchList)
                    completion(matchList)
                }
            }
        }.resume()
    }
}
