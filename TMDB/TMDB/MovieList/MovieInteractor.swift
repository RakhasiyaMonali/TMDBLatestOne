//
//  MovieInteractor.swift
//  TMDBMVVM
//
//  Created by techflitter on 13/03/19.
//  Copyright © 2019 Monali. All rights reserved.
//

import Foundation

struct MovieInteractor {
    func getAllMovie(completion : @escaping (([Movie]) -> ()) )  {
        if let url = URL(string: AppConstants.baseUrl) {
            Webservice().getMovies(url: url) { movies in
                completion (movies)
            }
        }
    }
}
