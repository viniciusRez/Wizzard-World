//
//  ElixirViewModel.swift
//  Wizzard Word
//
//  Created by Vinicius Rezende on 10/01/23.
//

import Foundation
import Alamofire
import UIKit
class RequestViewModel{
    var returnRequest: [Any] = []
    
    func getInfo(location: ModelEndPoint)-> [Any]{
        switch location {
        case .Elixirs:
            return returnRequest as! [ModelElixirs]
        case .Ingredients:
            return returnRequest as! [ModelIngredients]
        case .Houses:
            return returnRequest as! [ModelHouses]
        case .Spells:
            return returnRequest as! [ModelSpells]
        case .Wizards:
            return returnRequest as! [ModelWizard]
        }
    }
    func requestAPI(endPoint:ModelEndPoint,completion: @escaping() -> Void){

            let request = AF.request("https://wizard-world-api.herokuapp.com/\(endPoint)")
            
            switch endPoint {
            case .Elixirs:
                request.responseDecodable(of: [ModelElixirs].self
                ) { response in
                    if let request = response.value {
                        self.returnRequest = request
                        completion()
                    }
                }
         
                break
            case .Ingredients:
                request.responseDecodable(of: [ModelIngredients].self
                ) { response in
                    if let request = response.value {
                        self.returnRequest = request
                        completion()
                    }
                }
            case .Houses:
                request.responseDecodable(of: [ModelHouses].self
                ) { response in
                    if let request = response.value {
                        self.returnRequest = request
                        completion()
                    }
                }
            case .Spells:
                request.responseDecodable(of: [ModelSpells].self
                ) { response in
                    if let request = response.value {
                        self.returnRequest = request
                        completion()
                    }
                }
            case .Wizards:
                request.responseDecodable(of: [ModelWizard].self
                ) { response in
                    if let request = response.value {
                        self.returnRequest = request
                        completion()
                    }
                }
            }
        
    }
    
}
