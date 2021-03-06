//
//  PetsTableViewController.swift
//  ExampleStoryboard
//
//  Created by Nguyen Duc Hoang on 7/16/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class PetsTableViewController: UITableViewController {
    var pets:[Pet] = petsData
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetCell", for: indexPath) as! PetTableViewCell
        // Configure the cell...
        let eachPet = pets[indexPath.row] as Pet
//        cell.textLabel?.text = eachPet.name
//        cell.detailTextLabel?.text = eachPet.title
        /*
        if let labelName = cell.viewWithTag(100) as? UILabel {
            labelName.text = eachPet.name
        }
        if let labelTitle = cell.viewWithTag(101) as? UILabel {
            labelTitle.text = eachPet.title
        }
        */
        /*
        cell.labelName.text = eachPet.name
        cell.labelTitle.text = eachPet.title
        */
        cell.pet = eachPet
        return cell
    }
    
    //Unwind segues to this ViewController
    @IBAction func backToPetsViewController(segue:UIStoryboardSegue) {
        print("press cancel")
    }
    @IBAction func savePetDetail(segue:UIStoryboardSegue) {
        print("press Done")
        if let addPetTableViewController = segue.source as? AddPetTableViewController {
            //add the new pet to the pets array
            if let pet = addPetTableViewController.pet {
                self.pets.append(pet)
                //update the tableView
                let indexPath = IndexPath(row: self.pets.count-1, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
