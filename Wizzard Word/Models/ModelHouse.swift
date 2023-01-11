//
//  ModelHouse.swift
//  Wizzard Word
//
//  Created by Vinicius Rezende on 11/01/23.
//

import Foundation

struct ModelHouses:Decodable {
    let id:String?
    let name:String?
    let houseColoirs:String?
    let founder:String?
    let animal:String?
    let element:String?
    let ghost:String?
    let commonRoom:String?
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case houseColoirs
        case founder
        case animal
        case element
        case ghost
        case commonRoom
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.houseColoirs = try container.decodeIfPresent(String.self, forKey: .houseColoirs)
        self.founder = try container.decodeIfPresent(String.self, forKey: .founder)
        self.animal = try container.decodeIfPresent(String.self, forKey: .animal)
        self.element = try container.decodeIfPresent(String.self, forKey: .element)
        self.ghost = try container.decodeIfPresent(String.self, forKey: .ghost)
        self.commonRoom = try container.decodeIfPresent(String.self, forKey: .commonRoom)
    }
}
