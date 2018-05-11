//
//  MainTableViewController.swift
//  Mulan
//
//  Created by Alina Zaitseva on 5/10/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    var randomArray = (1...100).map{_ in Int(arc4random())}
    var resultArray: [[String]]!
    var enumSort = EnumSortType(rawValue: 5)
 
    @IBOutlet weak var tableStat: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        resultArray = Array(repeating: Array(repeating: "", count: randomArray.count), count: enumSort.count)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return enumSort.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataCellEntity", for: indexPath) as? DataCellEntity
            else { return UITableViewCell() }
        if resultArray.indices.contains(indexPath.section) {
            if resultArray[indexPath.section].indices.contains(indexPath.row) {
                cell.labelData?.text = resultArray[indexPath.section][indexPath.row]
            }
        }
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

