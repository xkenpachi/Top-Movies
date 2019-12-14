//
//  MainVC.swift
//  Top Movies
//
//  Created by Emre Öner on 12.12.2019.
//  Copyright © 2019 Emre Öner. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var movieArray = [Result]()
    var genreArray = [Genre]()
    var isDone = false
    var pageNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        title = "Top Movies List"
        API.shared.getMovieData(pageNumber: 1) { (movies) in
            
            self.movieArray = movies.results
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "detailSegue" {
            if let destionation = segue.destination as? DetailVC, let index = tableView.indexPathForSelectedRow?.row {
                destionation.movie = movieArray[index]
            }
        }
    }
    
}



