//
//  CustomImageView.swift
//  MovieBrowser
//
//  Created by Michelle Grover on 3/20/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {

    var task:URLSessionDataTask?

    public func loadImage(from url:URL, handler:@escaping(_ image:UIImage?) -> ()) {
//        let mainQueue = DispatchQueue.main
//        self.image = nil
        handler(nil)
        if let task = task {
            task.cancel()
        }

        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
//            self.image = imageFromCache
            handler(imageFromCache)
            return
        }

        task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let newImage = UIImage(data: data) else {
                print("error:")
                return
            }
            imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)

            DispatchQueue.main.async {
//                self.image = newImage
                handler(newImage)
            }
        }
        task!.resume()
    }
}
