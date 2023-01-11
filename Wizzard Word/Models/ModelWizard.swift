//
//  ModelWizard.swift
//  Wizzard Word
//
//  Created by Vinicius Rezende on 11/01/23.
//

import Foundation

struct ModelWizard:Decodable {
    let elixirs:[ModelIngredients]?
    let id:String?
    let firstName:String?
    let lastName:String?
    
    enum CodingKeys: CodingKey {
        case elixirs
        case id
        case firstName
        case lastName
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.elixirs = try container.decodeIfPresent([ModelIngredients].self, forKey: .elixirs)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
    }
}
