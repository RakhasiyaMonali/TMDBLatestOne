				//
//  Movie.swift
//  TMDB
//
//  Created by techflitter on 13/03/19.
//  Copyright © 2019 techflitter. All rights reserved.
//

import Foundation

struct Movie {
    var title :String
    var id :Int
    var overview :String
    var voteCount :Int
    var releaseDate : String
    var popularity :Double
    var image :String
    
    init?(dictionary :JSONDictionary) {
        self.id = (dictionary["id"] as? Int) ?? 0
        self.overview = (dictionary["overview"] as? String) ?? ""
        self.voteCount = (dictionary["vote_count"] as? Int) ?? 0
        self.releaseDate = (dictionary["release_date"] as? String ) ?? ""
        self.popularity = (dictionary["popularity"] as? Double) ?? 0
        self.image = (dictionary["backdrop_path"] as? String ) ?? ""
        self.title = (dictionary["title"] as? String ?? "") + " " + self.releaseDate.formateTitle()
    }
    
}

