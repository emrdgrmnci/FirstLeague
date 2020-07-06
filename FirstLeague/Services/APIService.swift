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
        let headers = [
            "content-type": "application/json",
            "authorization": "apikey 22fD7eXOwaKOcbYj6JN8qN:0Wwv5KWn8NvNbqPHDqlsgr"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.collectapi.com/sport/league?data.league=spor-toto-super-lig")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })
        dataTask.resume()
    }
}

/*
 let headers = [
 "content-type": "application/json",
 "authorization": "apikey 22fD7eXOwaKOcbYj6JN8qN:0Wwv5KWn8NvNbqPHDqlsgr"
 ]
 
 let request = NSMutableURLRequest(url: NSURL(string: "https://api.collectapi.com/sport/leaguesList")! as URL,
 cachePolicy: .useProtocolCachePolicy,
 timeoutInterval: 10.0)
 request.httpMethod = "GET"
 request.allHTTPHeaderFields = headers
 
 let session = URLSession.shared
 let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
 if (error != nil) {
 print(error)
 } else {
 let httpResponse = response as? HTTPURLResponse
 print(httpResponse)
 }
 })
 
 dataTask.resume()
 */
