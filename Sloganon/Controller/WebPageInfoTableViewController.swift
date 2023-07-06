//
//  WebPageInfoTableViewController.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/17/23.
//

import UIKit
import SafariServices

class WebPageInfoTableViewController: UITableViewController, SFSafariViewControllerDelegate, UITextFieldDelegate {

    var webPages: Array<WebPage> = []
    
    var sections = [K.HeaderText.webinfo1, K.HeaderText.webinfo2]
    
    var activityIndicatorView: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.view.backgroundColor = K.stepVCBackground
        webPages = WebPage.webPageList()
    
        self.tableView.register(WebPageInfoTableViewCell.self, forCellReuseIdentifier: WebPageInfoTableViewCell.identifier)
        self.tableView.register(AddWebPageTableViewCell.self, forCellReuseIdentifier: AddWebPageTableViewCell.identifier)
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
            let cell = tableView.dequeueReusableCell(withIdentifier: WebPageInfoTableViewCell.identifier, for: indexPath) as! WebPageInfoTableViewCell
            
            cell.title = webPages[indexPath.row].displayName
            cell.setColors(color: K.Color.webinfo)
            cell.darkenColor(byPercentage: percentageBy)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: AddWebPageTableViewCell.identifier, for: indexPath) as! AddWebPageTableViewCell
            let color = K.CellBackgroundColor.webinfo.darken(byPercentage: percentageBy)
            cell.setColors(color: color)
            cell.setDelegates(delegate: self)

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

            guard let url = URL(string: currentCell.url) else {
                DispatchQueue.main.async {
                    self.showErrorAlert(message: "Not a valid URL")
                }
                return
            }

            if !["http", "https"].contains(url.scheme?.lowercased() ?? "") {
                DispatchQueue.main.async {
                    self.showErrorAlert(message: "URL must begin with https:// or http://")
                }
            }

            DispatchQueue.main.async {
                self.showActivityIndicator()
            }

            url.isReachable(completion: {success in
                if success {

                    DispatchQueue.main.async {
                        //check if already exists in database
                        let exists = WebPage.alreadyExists(url: currentCell.url)
                        
                        if exists {
                            self.showErrorAlert(message: "Web page already exists")
                        } else {
                            // if a new webPage add to realm
                            WebPage.addWebPage(displayName: currentCell.title, url: currentCell.url)
                            currentCell.title = ""
                            currentCell.url = "https://www."
                            self.webPages = WebPage.webPageList()
                        }
                    }

                } else {
                    DispatchQueue.main.async {
                       self.showErrorAlert(message: "That web address is unreachable")
                    }
                }
                
                DispatchQueue.main.async {
                    self.hideActivityIndicator()
                    self.tableView.reloadData()
                }
                
            })


        } else {
            
            let urlString = indexPath.section == 0 ? webPages[indexPath.row].url : ""
            
            guard let url = URL(string: urlString) else {
                return
            }
                
            let vc = SFSafariViewController(url: url)
            vc.delegate = self
            
            present(vc, animated: true)
        }
    }

    // We don't want to be able to edit (i.e. delete cells) section 1
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 0 ? true : false
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if editingStyle == .delete {
                // Delete the row from the data source
                WebPage.deleteWebPage(id: webPages[indexPath.row]._id)
                
                webPages = WebPage.webPageList()
                
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }

    // MARK: - SF safariViewController delegate methods
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
    
    
    // MARK: - TextField delegate methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            textField.resignFirstResponder()
            if let nextField = textField.superview?.viewWithTag(1) as? UITextField {
                nextField.becomeFirstResponder()
            }
            return true
        } else {
            textField.resignFirstResponder()
           // self.tableView.selectRow(at: IndexPath(row: 1, section: 1), animated: true, scrollPosition: .none)
            return false
        }
    }
    

    // MARK: - Helper methods
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in

        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showActivityIndicator() {
        if (activityIndicatorView == nil) {
            activityIndicatorView = UIActivityIndicatorView(style: .large)
            activityIndicatorView?.center = self.view.center
            activityIndicatorView?.color = UIColor.black
            activityIndicatorView?.isHidden = false
            self.view.addSubview(activityIndicatorView!)
        }
        activityIndicatorView?.startAnimating()
    }

    func hideActivityIndicator(){
        if (activityIndicatorView != nil){
            activityIndicatorView?.isHidden = true
            activityIndicatorView?.stopAnimating()
        }
    }
    
}


