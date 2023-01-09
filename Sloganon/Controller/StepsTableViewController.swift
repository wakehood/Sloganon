//
//  SloganTableViewController.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 12/22/22.
//

import UIKit

class StepsTableViewController: UITableViewController {

    let steps = Steps()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return steps.stepsList.count
    }

    // MARK: - Configure TableView Rows with delegate methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.stepCellIdentifier, for: indexPath)

        var config = StepContentConfiguration()
        config.stepNum = String(indexPath.row + 1)
        config.step = steps.stepsList[indexPath.row]

        cell.contentConfiguration = config

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return K.RowHeight.steps
    }
   
    // MARK: - Configure TableView Headers with delegate methods
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        K.HeaderText._12Steps
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = UIView().headerViewWithLabel(title: self.tableView(tableView, titleForHeaderInSection: section) ?? "", color: UIColor.systemPink)
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return K.HeaderHeight
    }
}
