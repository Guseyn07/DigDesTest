//
//  CollectionViewCell.swift
//  DigitalDesignTest
//
//  Created by Guseyn Gasharov on 23.10.2020.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let array = Database.instance.getAllImages()
    
    @IBOutlet weak var thumbnailImage: LazyImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var isSavedIcon: UIImageView!
    
        
    func configure(item: Model) {
        isSavedIcon.isHidden = isSavedIconHidden(item)
        self.titleLabel.text = item.title
        self.thumbnailImage.loadImage(fromUrl: item.thumbnailUrl, placeHolderImage: "LaunchImage")
    }
    
    func isSavedIconHidden(_ item: Model) -> Bool {
        for i in array {
            if i.imgUrl == item.url {
                return false
            }
        }
        return true
    }
    
}


