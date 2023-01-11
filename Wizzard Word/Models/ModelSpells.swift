//
//  ModelSpells.swift
//  Wizzard Word
//
//  Created by Vinicius Rezende on 10/01/23.
//

import Foundation

struct ModelSpells:Decodable{
    let id:String?
    let name: String?
    let incantation: String?
    let effect: String?
    let canBeVerbal: Bool?
    let type: String?
    let light: String?
    let creator: String?
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case incantation
        case effect
        case canBeVerbal
        case type
        case light
        case creator
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.incantation = try container.decodeIfPresent(String.self, forKey: .incantation)
        self.effect = try container.decodeIfPresent(String.self, forKey: .effect)
        self.canBeVerbal = try container.decodeIfPresent(Bool.self, forKey: .canBeVerbal)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.light = try container.decodeIfPresent(String.self, forKey: .light)
        self.creator = try container.decodeIfPresent(String.self, forKey: .creator)
    }
}
