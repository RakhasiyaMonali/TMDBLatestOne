//
//  MovieListTableViewCell.swift
//  TMDBMVVM
//
//  Created by Monali on 11/03/19.
//  Copyright © 2019 Monali. All rights reserved.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet weak var imgPic: UIImageView!
    @IBOutlet weak var lblMovieName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(movie:Movie) {
        lblMovieName.text = movie.title
        imgPic.downloadImage(from: movie.image)
    }
    
}
