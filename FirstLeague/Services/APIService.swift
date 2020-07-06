//
//  APIService.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 6.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import Foundation

protocol APIServiceProtocol {
    func getTeams(url: URL, completion: @escaping CallBack<Main?>)
}

class APIService: APIServiceProtocol {
    func getTeams(url: URL, completion: @escaping CallBack<Main?>) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let teamList = try? JSONDecoder().decode(Main.self, from: data)
                completion(countryList)
            }
        }.resume()
        
    }
}
