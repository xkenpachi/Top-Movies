//
//  MovieCell.swift
//  Top Movies
//
//  Created by Emre Öner on 13.12.2019.
//  Copyright © 2019 Emre Öner. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(movie: Result) {
        
        movieTitleLabel.text = movie.title != movie.originalTitle ? "Title: \(movie.title) - \(movie.originalTitle)" : "Title: \(movie.title)"
        rateLabel.text = "IMDB: \(movie.voteAverage)"
        releaseDateLabel.text = "Release Date: \(movie.releaseDate)"
  
        let url = "https://image.tmdb.org/t/p/w500/\(movie.posterPath)"
        posterImageView.cachedImages(urlString: url)
    }

}
