//
//  SlogansSayingOrAcronymsTableViewController.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 2/4/23.
//

import UIKit

protocol SlogansSayingOrAcronymsTableViewControllerDelegate : NSObjectProtocol {
    func updateDataAndTableview()
}

class SlogansSayingOrAcronymsTableViewController: UITableViewController {
    
    var selectedTitle = ""
    var arrayOfSelectedType : Array<SloganSayingOrAcronym>?
    
    weak var delegate : SlogansSayingOrAcronymsTableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        navBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 25.0)]
        view.addSubview(navBar)

        let navItem = UINavigationItem(title: selectedTitle)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        
        doneItem.tintColor = K.HeaderBackgroundColor.ssoa

        navItem.rightBarButtonItem = doneItem


        navBar.setItems([navItem], animated: false)
        
        
    }
    
    @objc func done() {

        self.dismiss(animated: true)
        if let delegate = delegate{
            delegate.updateDataAndTableview()
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return arrayOfSelectedType?.count ??   1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.slogansayingAcronymCellIdentifier, for: indexPath)

        let percentageBy = UIColor.getPercentBy(row: indexPath.row, repeatEvery: 10)
        
        let itemText = arrayOfSelectedType?[indexPath.row].text
        let isFavorite = arrayOfSelectedType?[indexPath.row].isFavorite

        cell.contentConfiguration = OneLabelContentConfiguration(text: itemText!, cellColor: K.CellContentColor.ssoa, percentageBy: percentageBy)
        cell.backgroundColor = K.CellBackgroundColor.ssoa.darken(byPercentage: percentageBy)
        
        //set up the heart accessory view
        cell.accessoryType = (isFavorite ?? false) ? .checkmark : .none
        let heartImage = (isFavorite!) ?
        UIImage(systemName: K.accessoryViewIcon.selectedSlogan) :
        UIImage(systemName: K.accessoryViewIcon.unselectedSlogan)
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        imgView.image = heartImage
        cell.accessoryView = imgView

        return cell
    }
    
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
            tableView.deselectRow(at: indexPath, animated: true)
    
            if let slogan = arrayOfSelectedType?[indexPath.row]  {
                SloganSayingOrAcronym.toggleIsFavorite(ssoa: slogan)
    
//                //update class member list
//                slogans = SloganSayingOrAcronym.getSlogans()
    
                //update the tableview
                tableView.reloadData()
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
