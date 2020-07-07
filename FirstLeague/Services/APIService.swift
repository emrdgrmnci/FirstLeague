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
                    completion(mainList)
                }
            }
        }.resume()
    }
}
