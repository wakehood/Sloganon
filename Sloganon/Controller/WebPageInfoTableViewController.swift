//
//  InfoTableViewController.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/17/23.
//

import UIKit
import SafariServices

class WebPageInfoTableViewController: UITableViewController, SFSafariViewControllerDelegate {

    var webPages: Array<WebPage> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = K.stepVCBackground
        webPages = WebPage.webPageList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        navBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 25.0)]
        view.addSubview(navBar)

        let navItem = UINavigationItem(title: "Helpful Alanon Websites")
        navBar.barTintColor = K.stepVCBackground

        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        
        addItem.tintColor = K.HeaderBackgroundColor.ssoa

        navItem.rightBarButtonItem = addItem
        navBar.backgroundColor = K.stepVCBackground

        navBar.setItems([navItem], animated: false)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return webPages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.webPageInfoCellIdentifier, for: indexPath)

        // Configure the cell...
        let percentageBy = UIColor.getPercentBy(row: indexPath.row, repeatEvery: 10)
        let config = OneLabelContentConfiguration(text: webPages[indexPath.row].displayName, cellColor: K.CellContentColor.webinfo, percentageBy: percentageBy)

        cell.contentConfiguration = config
        cell.backgroundColor = K.CellBackgroundColor.webinfo.darken(byPercentage: percentageBy)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return K.RowHeight.webinfo
    }
   
    // MARK: - Configure TableView Headers with delegate methods
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        K.HeaderText.webinfo
//    }
//
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let headerView = UIView().headerViewWithLabel(title: self.tableView(tableView, titleForHeaderInSection: section) ?? "", color: K.HeaderBackgroundColor.webinfo)
//
//        return headerView
//    }
//
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return K.HeaderHeight
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlString = webPages[indexPath.row].url
        
        if let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url)
            vc.delegate = self

            present(vc, animated: true)
        }
    }
    
    @objc func add() {

        print("Add")
        var textField = UITextField()
        let alert = UIAlertController(title: "Add a WebSite", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Webpage Title | url", style: .default) { (action) in
            
            print("Add Item \(String(describing: textField.text))")
//            if let currentCategory = self.selectedCategory {
//                do {
//                    try self.realm.write {
//                        let newItem = Item()
//                        newItem.title = textField.text!
//                        newItem.dateCreated = Date()
//                        currentCategory.items.append(newItem)
//                    }
//                } catch {
//                    print("Error saving new items, \(error)")
//                }
//            }
//            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    // MARK: - Configure safariViewController delegate methods
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
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
