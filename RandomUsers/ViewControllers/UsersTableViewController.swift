//
//  UsersTableViewController.swift
//  RandomUsers
//
//  Created by Austin Potts on 9/5/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {

    let apiController = APIController()
    
    //Calling Networking Method
    override func viewDidLoad() {
        super.viewDidLoad()
        apiController.getUsers { (error) in
            if let error = error{
                NSLog("Error Performing Data Task: \(error)")
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return apiController.user.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)

        let user = apiController.user[indexPath.row]
        cell.textLabel?.text = user.name.first.capitalized + " " + user.name.last.capitalized
        guard let imageData = try? Data(contentsOf: user.picture.thumbnail) else {fatalError()}
        cell.imageView?.image = UIImage(data: imageData)
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

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UserDetailSegue" {
            guard let userDetailVc = segue.destination as? UserDetailViewController else {return}
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let user = apiController.user[indexPath.row]
            userDetailVc.user = user
        }
    }
    
    
    

}
