//
//  NetworkManager.swift
//  DigitalDesignTest
//
//  Created by Guseyn Gasharov on 23.10.2020.
//

import Foundation
import UIKit

let url = "http://jsonplaceholder.typicode.com/photos"

class NetworkManager {
    
    static let networkManager = NetworkManager()
    
    func request(completion: @escaping ([Model]) -> Void) {
        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let result = self.decodeJSON(type: [Model].self, from: data) else { print(error?.localizedDescription); return }
            completion(result)
        }.resume()
    }
    
    func getImage(imageUrl: String) -> UIImage? {
        guard let url = URL(string: imageUrl) else { return UIImage(named: "LaunchImage") }
        let data = try? Data(contentsOf: url)
        let image = UIImage(data: data!)
        return image
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
}
