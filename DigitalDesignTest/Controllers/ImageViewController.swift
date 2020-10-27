//
//  ImageViewController.swift
//  DigitalDesignTest
//
//  Created by Guseyn Gasharov on 24.10.2020.
//

import UIKit

class ImageViewController: UIViewController {
    
    var url: String!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image()
    }
    
    func image() -> UIImage? {
        
        for i in Database.instance.getAllImages() {
            while i.imgUrl == url {
                let imageFromCoreData = UIImage(data: i.img!)
                print("Image from Core Data")
                return imageFromCoreData
            }
        }
        
        if let imageFromUrl = NetworkManager.networkManager.getImage(imageUrl: url) {
            Database.instance.saveImageinCoredata(at: imageFromUrl.pngData()!, url: url)
            print("Image from URL")
            return imageFromUrl
        } else {
            return UIImage(named: "LaunchImage")
        }
    }
}
