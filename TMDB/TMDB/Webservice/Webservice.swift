//
//  Webservice.swift
//  TMDBMVVM
//
//  Created by Monali on 08/03/19.
//  Copyright © 2019 Monali. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String:Any]

class Webservice {
    func getMovies(url :URL, callback :@escaping ([Movie]) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let dictionary = json as! JSONDictionary
                var movies:[Movie] = []
                if let movieDictionaries = dictionary["results"] as? [JSONDictionary] {
                    for respObject in movieDictionaries {
                        if let movieModel = Movie(dictionary: respObject) {
                            movies.append(movieModel)
                        }
                    }
                }
                DispatchQueue.main.async {
                    callback(movies)
                }
            }
            }.resume()
    }
}
