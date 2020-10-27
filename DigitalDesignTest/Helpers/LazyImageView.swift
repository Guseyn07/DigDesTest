//
//  LazyImageView.swift
//  DigitalDesignTest
//
//  Created by Guseyn Gasharov on 24.10.2020.
//

import Foundation
import UIKit

class LazyImageView: UIImageView {
    
    private let imageCache = NSCache<AnyObject, UIImage>()
    
    func loadImage(fromUrl url: String, placeHolderImage: String) {
        self.image = UIImage(named: placeHolderImage)
        
        if let cachedImage = self.imageCache.object(forKey: url as AnyObject) {
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            
            if let image = NetworkManager.networkManager.getImage(imageUrl: url) {
                DispatchQueue.main.async {
                    self!.imageCache.setObject(image, forKey: url as AnyObject)
                    self?.image = image
                }
            }
        }
    }
}

