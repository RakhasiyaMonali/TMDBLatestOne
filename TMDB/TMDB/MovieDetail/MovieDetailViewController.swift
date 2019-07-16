//
//  MovieDetailViewController.swift
//  TMDB
//
//  Created by techflitter on 13/03/19.
//  Copyright © 2019 techflitter. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblMovieReleasedDate: UILabel!
    @IBOutlet weak var lblVoteCount: UILabel!
    @IBOutlet weak var lblPopularity: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    var movieDetail : Movie?


    override func viewDidLoad() {
        super.viewDidLoad()
        setMovies()
    }
        
    func setMovies() {
        self.lblMovieTitle.text = movieDetail?.title
        self.lblVoteCount.text = "\(movieDetail?.voteCount ?? 0)"
        self.lblMovieReleasedDate.text = movieDetail?.releaseDate
        self.lblPopularity.text = "\(movieDetail?.popularity ?? 0)"
        self.lblOverview.text = movieDetail?.overview

    }
    
    @IBAction func btnPlayClick(_ sender: Any) {
        if let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4") {
            let player = AVPlayer(url: videoURL)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            present(playerViewController, animated: true) {
                player.play()
            }
        }
    }
}
