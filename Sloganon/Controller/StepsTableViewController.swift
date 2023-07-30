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
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.register(StepsTableViewCell.self, forCellReuseIdentifier: StepsTableViewCell.identifier)
        
        self.tableView.register(StepsRefTableViewCell.self, forCellReuseIdentifier: StepsRefTableViewCell.identifier)
        
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
            return 1 //the reference row
        }
    }

    // MARK: - Configure TableView Rows with delegate methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              
        if indexPath.section == 0 {
            let percentageBy = UIColor.getPercentBy(row: indexPath.row, repeatEvery: 12)
            let cell = tableView.dequeueReusableCell(withIdentifier: StepsTableViewCell.identifier, for: indexPath) as! StepsTableViewCell
            
            cell.leftTitle = String(indexPath.row + 1) //Step Number
            cell.mainTitle = steps.stepsList[indexPath.row]
            cell.setColors(color: K.CellContentColor.step)
            cell.darkenColor(byPercentage: percentageBy)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: StepsRefTableViewCell.identifier, for: indexPath) as! StepsRefTableViewCell
            
            cell.leftTitle = K.referenceNumber
            cell.mainTitle = K.stepsReference
            
            return cell
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
            let _12StepString = NSMutableAttributedString(string: "The 12 Steps ", attributes: [.font: UIFont.headerFont])
            
            let fontSuper:UIFont? = UIFont(name: "Helvetica", size:10)
            let superscriptString = NSMutableAttributedString(string: K.referenceNumber, attributes: [.font:fontSuper!, .baselineOffset:10])
            
            let combinedString = NSMutableAttributedString()
            combinedString.append(_12StepString)
            combinedString.append(superscriptString)
            
            let headerView = UIView().headerViewWithAttributedLabel(title: combinedString, color: UIColor.heading)
            
            return headerView
        }
        else{
            let headerView = UIView().headerViewWithLabel(title: self.tableView(tableView, titleForHeaderInSection: section) ?? "", color: UIColor.heading)
            return headerView
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return  K.HeaderHeight
        }
        else{
            return K.StepsReferenceHeaderHeight
        }
    }
}
