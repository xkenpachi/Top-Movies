//
//  API.swift
//  Top Movies
//
//  Created by Emre Öner on 13.12.2019.
//  Copyright © 2019 Emre Öner. All rights reserved.
//

import Foundation


class API: NSObject {
    
    static let shared = API()
    var pageNumber = 1
    
    func getMovieData(pageNumber: Int, completion: @escaping (MovieData) -> Void)  {
       
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=cc7247c8423e6b43d9c471fda59f61c9&language=en-US&page=\(pageNumber)") else {return}
        
        let req = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
            if error != nil {
                print(error.debugDescription)
                return
            }
            
            if let data = data {
//                print(String(data: data, encoding: .utf8))
                let decoder = JSONDecoder()
                do {
                    let results = try decoder.decode(MovieData.self, from: data)
                    completion(results)
                } catch {
                    
                }
            }
            
        }
        task.resume()
    }
}
