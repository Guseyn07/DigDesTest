//
//  Database.swift
//  DigitalDesignTest
//
//  Created by Guseyn Gasharov on 26.10.2020.
//

import Foundation
import UIKit
import CoreData

class Database {
    
    static let instance = Database()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveImageinCoredata(at imgData: Data, url: String) {
        let profile = NSEntityDescription.insertNewObject(forEntityName: "Profile", into: context) as! Profile
        profile.img = imgData
        profile.imgUrl = url
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getAllImages() -> [Profile] {
        var arrProfile = [Profile]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        do {
            arrProfile = try context.fetch(fetchRequest) as! [Profile]
        } catch let error {
            print(error.localizedDescription)
        }
        return arrProfile
    }
}
