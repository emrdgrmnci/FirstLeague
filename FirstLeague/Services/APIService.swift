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
            if let data = data {
                do {
                    let dataString = String(data: data, encoding: .utf8)
                    let jsondata = dataString?.data(using: .utf8)
                    let result = try JSONDecoder().decode(Main.self, from: jsondata!)
                    print(result)
                } catch let error {
                    print("Localized Error: \(error.localizedDescription)")
                    print("Error: \(error)")
                }
            }
        }.resume()
    }
}
