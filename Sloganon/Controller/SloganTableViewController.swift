//
//  SloganTableViewController.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/1/23.
//

import UIKit

class SloganTableViewController: UITableViewController {
    
    var slogans = Slogans()
    
    let sections = [K.HeaderText.sloganOfTheDay,
                    K.HeaderText.slogans,
                    K.HeaderText.acronyms]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: K.CellNibNames.sloganOfTheDayCellNibName, bundle: nil), forCellReuseIdentifier: K.CellReuseIdentifiers.sloganOfTheDayCellIdentifier)
        
        tableView.register(UINib(nibName: K.CellNibNames.acronymCellNibName, bundle: nil), forCellReuseIdentifier: K.CellReuseIdentifiers.acronymCellIdentifier)
  
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return slogans.sloganList.count
        } else  {
            return slogans.acronymList.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
                
        if section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.sloganOfTheDayCellIdentifier, for: indexPath) as! SloganOfTheDayTableViewCell
            cell.sloganOfTheDayLabel.text = slogans.getSloganOfTheDay()

            return cell
        } else if section == 1 {
            let cell  = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.sloganCellIdentifier, for: indexPath)
            cell.textLabel?.text = slogans.sloganList[indexPath.row]
            return cell
        } else  {
            let cell  = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.acronymCellIdentifier, for: indexPath) as! AcronymTableViewCell
            
            cell.acronymTextView.text = slogans.acronymList[indexPath.row]
           // cell.textLabel?.text = slogans.acronymList[indexPath.row]
            return cell
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        if section == 0 {
            return K.HeaderHeight.sloganOfTheDay
        } else if section == 1 {
            return K.HeaderHeight.slogans
        } else {
            return K.HeaderHeight.acronyms
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return K.HeaderText.sloganOfTheDay
        } else if section == 1 {
            return K.HeaderText.slogans
        } else {
            return K.HeaderText.acronyms
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 20, y: 8, width: 320, height: 20)
        myLabel.font = UIFont.boldSystemFont(ofSize: 18)
        myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)

        let headerView = UIView()
        headerView.addSubview(myLabel)
        
        return headerView
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
