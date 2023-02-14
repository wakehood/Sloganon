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
    
    var sections = [K.HeaderText.webinfo1, K.HeaderText.webinfo2]
    
    var userInputTitle = ""
    var userInputUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = K.stepVCBackground
        webPages = WebPage.webPageList()
        self.tableView.register(UINib(nibName: K.CellNibNames.addWebPageInfoNibName, bundle: nil), forCellReuseIdentifier: K.CellReuseIdentifiers.addWebPageInfoIdentifier)

    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return webPages.count
        } else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let percentageBy = UIColor.getPercentBy(row: indexPath.row, repeatEvery: 10)
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.webPageInfoCellIdentifier, for: indexPath)

            // Configure the cell...
            cell.contentConfiguration = OneLabelContentConfiguration(text: webPages[indexPath.row].displayName, cellColor: K.CellContentColor.webinfo, percentageBy: percentageBy)
            
            cell.backgroundColor = K.CellBackgroundColor.webinfo.darken(byPercentage: percentageBy)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.addWebPageInfoIdentifier, for: indexPath) as! AddWebPageTableViewCell
            
            let color = K.CellBackgroundColor.webinfo.darken(byPercentage: percentageBy)
            
            cell.webPageNameTextField.text = ""
            cell.urlTextField.text = ""
            cell.webPageNameTextField.backgroundColor = UIColor.white
            cell.urlTextField.backgroundColor = UIColor.white
            cell.backgroundColor = color
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return K.RowHeight.webinfo
    }
   
    // MARK: - Configure TableView Headers with delegate methods
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0  {
            return K.HeaderText.webinfo1
        } else {
            return K.HeaderText.webinfo2
        }
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = UIView().headerViewWithLabel(title: self.tableView(tableView, titleForHeaderInSection: section) ?? "", color: K.HeaderBackgroundColor.webinfo)

        return headerView
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return K.HeaderHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //if user added url
        if indexPath.section == 1 {
            let currentCell = tableView.cellForRow(at: indexPath) as! AddWebPageTableViewCell
            userInputTitle = currentCell.webPageNameTextField.text ??  ""
            userInputUrl = currentCell.urlTextField.text ?? ""
        }
        
        let urlString = indexPath.section == 0 ? webPages[indexPath.row].url : userInputUrl
        
        guard let url = URL(string: urlString) else {
            
            let alert = UIAlertController(title: "Error", message: "Not a valid URL", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                    case .default:
                    print("default")
                    
                    case .cancel:
                    print("cancel")
                 
                default:
                    print("the actual default")
                    
                }
            }))
            
            self.present(alert, animated: true, completion: nil)
            
            return

        }
        
        if ["http", "https"].contains(url.scheme?.lowercased() ?? "") {
            
            
            let vc = SFSafariViewController(url: url)
            vc.delegate = self
            
            present(vc, animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message:"URL must begin with https:// or http://", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                    case .default:
                    print("default")
                    
                    case .cancel:
                    print("cancel")
                 
                default:
                    print("the actual default")
                    
                }
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
            
        
//        if indexPath.section == 1 {
//            let currentCell = tableView.cellForRow(at: indexPath) as! AddWebPageTableViewCell
//            currentCell.webPageNameTextField.text =  ""
//            currentCell.urlTextField.text = ""
//        }
        
    }
    
    @objc func add() {

        print("Add")
        var textField = UITextField()
        let alert = UIAlertController(title: "Add a WebSite", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Webpage Title | url", style: .default) { (action) in
            
            print("Add Item \(String(describing: textField.text))")
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
    
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        if didLoadSuccessfully {
            //add to realm
            WebPage.addWebPage(displayName: userInputTitle, url: userInputUrl)

            webPages = WebPage.webPageList()
            self.tableView.reloadData()
        } else {
            controller.dismiss(animated: true)
        }
    }
       
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if editingStyle == .delete {
                // Delete the row from the data source
                WebPage.deleteWebPage(id: webPages[indexPath.row]._id)
                
                webPages = WebPage.webPageList()
                
                tableView.deleteRows(at: [indexPath], with: .fade)
            } else if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            }
        }
        
    }
    

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
