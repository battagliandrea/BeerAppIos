//
//  BeerData.swift
//  BeerApp
//
//  Created by Andrea on 22/03/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import Foundation

struct BeerData: Codable {
  
    let id: Int?
    let name: String?
    let description: String?
    let imageUrl: String?
  
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case imageUrl = "image_url"
    }
}

extension Array where Iterator.Element == BeerData {
    
    func mapTo() -> [BeerEntity]{
        var beerList = [BeerEntity]()
        self.forEach { (decodedData) in
            let id = decodedData.id ?? 0
            let name = decodedData.name ?? ""
            let description = decodedData.description ?? ""
            let imageUrl = decodedData.imageUrl ?? ""

            let beerEntity = BeerEntity(id: id, name: name, description: description, imageUrl: imageUrl)
            beerList.append(beerEntity)
        }
        
        return beerList
    }
}

