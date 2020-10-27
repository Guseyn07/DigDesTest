//
//  CollectionViewController.swift
//  DigitalDesignTest
//
//  Created by Guseyn Gasharov on 23.10.2020.
//

import UIKit

private let reuseIdentifier = "Cell"

let itemsPerRow: CGFloat = 2
let sectionInserts = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)

class CollectionViewController: UICollectionViewController {
    
    var array = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.networkManager.request { (model) in
            self.array = model
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        let item = array[indexPath.item]
        cell.configure(item: item)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageUrl = array[indexPath.item].url
        performSegue(withIdentifier: "openImage", sender: imageUrl)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageUrl = sender else { return }
        let destinationVC = segue.destination as? ImageViewController
        destinationVC?.url = imageUrl as? String
    }
}
