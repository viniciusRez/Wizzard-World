//
//  ModelElixirs.swift
//  Wizzard Word
//
//  Created by Vinicius Rezende on 10/01/23.
//

import Foundation

struct ModelElixirs:Decodable{
    let Id:String?
    let name:String?
    let effect:String?
    let sideEffects:String?
    let characteristics:String?
    let time:String?
    let manufacturer:String?
    let ingredients:[ModelIngredients]?
    enum CodingKeys: CodingKey {
        case Id
        case name
        case effect
        case sideEffects
        case characteristics
        case time
        case manufacturer
        case ingredients
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.Id = try container.decodeIfPresent(String.self, forKey: .Id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.effect = try container.decodeIfPresent(String.self, forKey: .effect)
        self.sideEffects = try container.decodeIfPresent(String.self, forKey: .sideEffects)
        self.characteristics = try container.decodeIfPresent(String.self, forKey: .characteristics)
        self.time = try container.decodeIfPresent(String.self, forKey: .time)
        self.manufacturer = try container.decodeIfPresent(String.self, forKey: .manufacturer)
        self.ingredients = try container.decodeIfPresent([ModelIngredients].self, forKey: .ingredients)
    }
}
