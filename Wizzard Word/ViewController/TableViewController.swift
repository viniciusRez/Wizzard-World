//
//  TableViewController.swift
//  Wizzard Word
//
//  Created by Vinicius Rezende on 10/01/23.
//

import UIKit
import Alamofire
class TableViewController: UITableViewController {
    var viewModel: RequestViewModel?
    
    var listOfElixirs: [ModelElixirs] = []
    var listOfIngredients: [ModelIngredients] = []
    var listOfWizzards: [ModelWizard] = []
    var listOfSpells: [ModelSpells] = []
    var listOfHouses: [ModelHouses] = []
    
    var selectedBtn:ModelEndPoint? = ModelEndPoint.Houses
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.viewModel = RequestViewModel()
        self.load.startAnimating()
        if self.selectedBtn == nil{
            self.selectedBtn = ModelEndPoint.Houses
        }
        self.viewModel?.requestAPI(endPoint: self.selectedBtn!, completion: {
            if let option = self.selectedBtn{
                switch option {
                case .Elixirs:
                    self.listOfElixirs = (self.viewModel?.getInfo(location: self.selectedBtn!) ) as! [ModelElixirs]
                case .Ingredients:
                    self.listOfIngredients = (self.viewModel?.getInfo(location: self.selectedBtn!) ) as! [ModelIngredients]

                case .Houses:
                    self.listOfHouses = (self.viewModel?.getInfo(location: self.selectedBtn!) ) as! [ModelHouses]

                case .Spells:
                    self.listOfSpells = (self.viewModel?.getInfo(location: self.selectedBtn!) ) as! [ModelSpells]

                case .Wizards:
                    self.listOfWizzards = (self.viewModel?.getInfo(location: self.selectedBtn!) ) as! [ModelWizard]
                }
            }
            self.tableView.reloadData()
            self.load.stopAnimating()
            
        })
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var count:Int = 0
         if let option = self.selectedBtn{
            switch option {
            case .Elixirs:
                count =  self.listOfElixirs.count
            case .Ingredients:
                count = self.listOfIngredients.count
            case .Houses:
                count = self.listOfHouses.count
            case .Spells:
                count = self.listOfSpells.count
            case .Wizards:
                count = self.listOfWizzards.count
            }
        }
        return count
    }

    @IBOutlet weak var load: UIActivityIndicatorView!
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "content", for: indexPath)
        var label:String?
        var detailLabel:String?
        
        // Configure the cell...
        if let option = self.selectedBtn{
           switch option {
           case .Elixirs:
               label =  "Nome: " + self.listOfElixirs[indexPath.row].name!
               detailLabel =  "Efeito: " + (self.listOfElixirs[indexPath.row].effect ?? "Desconhecido")
           case .Ingredients:
               if self.listOfIngredients[indexPath.row].name != nil{
                   label =  "Ingrediente: " + (self.listOfIngredients[indexPath.row].name ?? "")
               }
           case .Houses:
               label = "House:  " + self.listOfHouses[indexPath.row].name!
               detailLabel = "Ghost: " + self.listOfHouses[indexPath.row].ghost!
           case .Spells:
               label =  "Feitiço: " + self.listOfSpells[indexPath.row].name!
               detailLabel =  "Efeito: " + (self.listOfSpells[indexPath.row].effect ?? "Desconhecido")
           case .Wizards:
               label = "Bruxo: " + (self.listOfWizzards[indexPath.row].firstName ?? " ") + " " + (self.listOfWizzards[indexPath.row].lastName ?? " ")
           }
       }
        cell.textLabel?.text = label
        cell.detailTextLabel?.text = detailLabel
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
