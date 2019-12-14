//
//  DetailVC.swift
//  Top Movies
//
//  Created by Emre Öner on 14.12.2019.
//  Copyright © 2019 Emre Öner. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var movie: Result!

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overViewLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = "https://image.tmdb.org/t/p/w500/\(movie.posterPath)"
        posterImageView.cachedImages(urlString: url)
        
        titleLabel.text = movie.title
        overViewLabel.text = movie.overview
    }

}
