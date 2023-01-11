//
//  ViewController.swift
//  Wizzard Word
//
//  Created by Vinicius Rezende on 10/01/23.
//

import UIKit

class ViewController: UIViewController {
    var viewModel: MenuViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MenuViewModel()
        
    }
    
    @IBAction func btnElixirs(_ sender: Any) {
        self.viewModel?.Router(navigation: self,getModel: ModelEndPoint.Elixirs)
    }
    @IBAction func btnIngredients(_ sender: Any) {
        self.viewModel?.Router(navigation: self,getModel: ModelEndPoint.Ingredients)
    }
    @IBAction func btnHouses(_ sender: Any) {
        
    }
    
    @IBAction func btnSpells(_ sender: Any) {
        self.viewModel?.Router(navigation: self,getModel: ModelEndPoint.Spells)
        
    }
    @IBAction func btnWizards(_ sender: Any) {
        self.viewModel?.Router(navigation: self,getModel: ModelEndPoint.Wizards)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seeList" {
            let destino = segue.destination as! TableViewController
            destino.selectedBtn = sender as? ModelEndPoint
        }
    }
}

