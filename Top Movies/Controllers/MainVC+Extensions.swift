//
//  MainVC+Extensions.swift
//  Top Movies
//
//  Created by Emre Öner on 14.12.2019.
//  Copyright © 2019 Emre Öner. All rights reserved.
//

import UIKit

extension MainVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        
        cell.setupCell(movie: movieArray[indexPath.row])
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if yOffset > contentHeight - scrollView.frame.height * 1.2 {
            if !isDone {
                addMovies()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func addMovies() {
        indicator.startAnimating()
        isDone = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.pageNumber += 1
            API.shared.getMovieData(pageNumber: self.pageNumber) { (tempMovies) in
                self.movieArray += tempMovies.results
                self.isDone = false
                DispatchQueue.main.async {
                    self.indicator.stopAnimating()
                    self.tableView.reloadData()
                }
                
            }
        }
    }
}
