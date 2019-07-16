//
//  MovieListViewModel.swift
//  TMDBMVVM
//
//  Created by Monali on 08/03/19.
//  Copyright © 2019 Monali. All rights reserved.
//

import Foundation

protocol MovieListViewDelegate: class {
    func showError(message: String)
    func refresh()
}

class MovieListPresenter {
    private weak var movieViewDelegate :MovieListViewDelegate?
    private let interactor = MovieInteractor()
    private var movie = [Movie]()
    var filteredMovie = [Movie]()
    private var alert = Alert()
    
    init(delegate : MovieListViewDelegate) {
        self.movieViewDelegate = delegate
    }
    
    func fetchAllMovie() {
        interactor.getAllMovie { (movie) in
            self.movie = movie
            self.filteredMovie = movie
            if self.movie.count == 0 {
                self.movieViewDelegate?.showError(message: "No data available.")
            }
            self.movieViewDelegate?.refresh()
        }
    }
    
    func filterMoviesUsingYears(minYear : String , maxYear : String) {
        var filteredmovies :[Movie] = [Movie]()
        
        for m in movie {
            let year = m.releaseDate.formateTitle()
            
            if year >= minYear  && year <= maxYear {
                filteredmovies.append(m)
            }
        }
        self.filteredMovie = filteredmovies
        if filteredmovies.count == 0 {
            self.movieViewDelegate?.showError(message: "No data available.")
        }
        self.movieViewDelegate?.refresh()
    }
    
    func clearFilter() {
        self.filteredMovie = movie
        self.movieViewDelegate?.refresh()
    }
}

