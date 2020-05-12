//
//  UIImageView+Async.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 12/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
    func loadImage(with url : URL?, defaultImage : String? = nil) {
        if let defaultImage = defaultImage {
            self.image = UIImage(named: defaultImage)
        }
        
        guard let url = url else { return }
        
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error ?? "error")
                return
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })

        }).resume()
    }
}
