//
//  SloganTableViewController.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 12/22/22.
//

import UIKit

class StepsTableViewController: UITableViewController {

    let steps = Steps()
    
    let numSections = 2 //steps and copyright
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = K.stepVCBackground

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return numSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return steps.stepsList.count
        }
        else {
            return 1 //the copyright row
        }
    }

    // MARK: - Configure TableView Rows with delegate methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var reUseIdentifier = ""
        
        if indexPath.section == 0 {
            reUseIdentifier = K.CellReuseIdentifiers.stepCellIdentifier
        } else {
            reUseIdentifier = K.CellReuseIdentifiers.stepCopyrightCellIdentifier
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: reUseIdentifier, for: indexPath)
            
        
        let percentageBy = UIColor.getPercentBy(row: indexPath.row, repeatEvery: 12)
        
        if indexPath.section == 0 {
            cell.contentConfiguration = TwoLabelContentConfiguration(leftText: String(indexPath.row + 1), mainText: steps.stepsList[indexPath.row], cellColor: K.CellContentColor.step, percentageBy: percentageBy)
        } else {
            cell.contentConfiguration = OneLabelContentConfiguration(text: K.stepsCopyright,cellColor: K.CellContentColor.step, percentageBy: percentageBy)
        }

        cell.backgroundColor = K.CellBackgroundColor.step.darken(byPercentage: percentageBy)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return K.RowHeight.steps
        }
        else{
            return K.RowHeight.stepsCopyright
        }
    }
   
    // MARK: - Configure TableView Headers with delegate methods
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return K.HeaderText._12Steps
        }
        else{
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = UIView().headerViewWithLabel(title: self.tableView(tableView, titleForHeaderInSection: section) ?? "", color: K.HeaderBackgroundColor.step)
            return headerView
        }
        else{
            let headerView = UIView().headerViewWithLabel(title: self.tableView(tableView, titleForHeaderInSection: section) ?? "", color: K.CellContentColor.step)
            return headerView
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return  K.HeaderHeight
        }
        else{
            return 0.0
        }
    }
}
