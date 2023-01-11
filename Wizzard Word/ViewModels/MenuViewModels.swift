//
//  MenuViewModels.swift
//  Wizzard Word
//
//  Created by Vinicius Rezende on 10/01/23.
//

import Foundation
import UIKit
class MenuViewModel{
    func Router(navigation: ViewController,getModel:ModelEndPoint){
        navigation.performSegue(withIdentifier: "seeList", sender: getModel)
        
        
    }
 
}


