//
//  Model.swift
//  DigitalDesignTest
//
//  Created by Guseyn Gasharov on 23.10.2020.
//

import Foundation


struct Model: Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
