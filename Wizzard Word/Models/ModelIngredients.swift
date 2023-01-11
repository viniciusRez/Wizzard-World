//
//  ModelIngredients.swift
//  Wizzard Word
//
//  Created by Vinicius Rezende on 10/01/23.
//

import Foundation

struct ModelIngredients: Decodable{
    let id:String?
    let name:String?
    enum CodingKeys: CodingKey {
        case id
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}
