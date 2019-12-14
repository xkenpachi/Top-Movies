//
//  ImageCacher.swift
//  Top Movies
//
//  Created by Emre Öner on 13.12.2019.
//  Copyright © 2019 Emre Öner. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, UIImage>()
var imageUrl: String?

extension UIImageView {
    func cachedImages(urlString: String) {

        DispatchQueue.main.async {
            self.image = nil
        }

        if let cached = imageCache.object(forKey: urlString as AnyObject) {
            DispatchQueue.main.async {
                self.image = cached
            }
            return
        }

        guard let imgUrl = URL(string: urlString) else {return}

        URLSession.shared.dataTask(with: imgUrl) { (data, response, error) in
            if error != nil {
                return
            }

            DispatchQueue.main.async {
                guard  let downloadedImage = UIImage(data: data!) else {return}
//                if imgUrl.absoluteString == urlString {
                    imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                    self.image = downloadedImage
//                }
            }
        }.resume()
    }
}
