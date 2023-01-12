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
        
        self.view.backgroundColor = K.stepVCBackground

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
        
        let percentageBy = UIColor.getPercentBy(row: indexPath.row, repeatEvery: 12)

        let config = StepContentConfiguration(stepNum: String(indexPath.row + 1), step: steps.stepsList[indexPath.row], percentageBy: percentageBy)

        cell.contentConfiguration = config
        cell.backgroundColor = K.CellBackgroundColor.step.darken(byPercentage: percentageBy)

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

        let headerView = UIView().headerViewWithLabel(title: self.tableView(tableView, titleForHeaderInSection: section) ?? "", color: K.HeaderBackgroundColor.step)
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return K.HeaderHeight
    }
}
