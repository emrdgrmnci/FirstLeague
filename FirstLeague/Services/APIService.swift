//
//  APIService.swift
//  FirstLeague
//
//  Created by Ali Emre Değirmenci on 6.07.2020.
//  Copyright © 2020 Ali Emre Degirmenci. All rights reserved.
//

import Foundation

protocol APIServiceProtocol {
    func getTeams(completion: @escaping CallBack<Main?>)
}

class APIService: APIServiceProtocol {
    func getTeams(completion: @escaping CallBack<Main?>) {

        let headers = [
            "content-type": "application/json",
            "authorization": "apikey 22fD7eXOwaKOcbYj6JN8qN:0Wwv5KWn8NvNbqPHDqlsgr"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.collectapi.com/sport/league?data.league=tff-1-lig")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
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
