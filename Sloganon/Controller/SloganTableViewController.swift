//
//  SloganTableViewController.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/1/23.
//

import UIKit

class SloganTableViewController: UITableViewController,  UITextFieldDelegate  {
    
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
        if section == K.SectionNumber.sloganOfTheDay {
            return 1
        } else if section == K.SectionNumber.slogans {
            return slogans.sloganList.count
        } else  {
            return slogans.acronymList.count
        }
    }

    // MARK: - Configure TableView Rows with delegate methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
                
        if section == K.SectionNumber.sloganOfTheDay {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.sloganOfTheDayCellIdentifier, for: indexPath) as! SloganOfTheDayTableViewCell
            cell.sloganOfTheDayTextView.text = slogans.getSloganOfTheDay()
            cell.sloganOfTheDayTextView.centerVertically()

            return cell
        } else if section == K.SectionNumber.slogans {
            let cell  = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.sloganCellIdentifier, for: indexPath)
            cell.textLabel?.text = slogans.sortedSloganList()[indexPath.row]
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.minimumScaleFactor = 0.5
            return cell
        } else  {
            let cell  = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.acronymCellIdentifier, for: indexPath) as! AcronymTableViewCell
            
            cell.acronymTextView.text = slogans.sortedAcronymList()[indexPath.row]
            cell.acronymTextView.centerVertically()

            return cell
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        if section == K.SectionNumber.sloganOfTheDay {
            return K.RowHeight.sloganOfTheDay
        } else if section == K.SectionNumber.slogans {
            return K.RowHeight.slogans
        } else {
            return K.RowHeight.acronyms
        }
    }
    
    // MARK: - Configure TableView Headers with delegate methods
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == K.SectionNumber.sloganOfTheDay {
            return K.HeaderText.sloganOfTheDay
        } else if section == K.SectionNumber.slogans {
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
        
        if section == K.SectionNumber.sloganOfTheDay {
            headerView.backgroundColor = K.HeaderBackgroundColors.sloganOfTheDay
        } else if section == K.SectionNumber.slogans {
            headerView.backgroundColor = K.HeaderBackgroundColors.slogan
        } else {
            headerView.backgroundColor = K.HeaderBackgroundColors.acronym
        }

        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return K.HeaderHeight
    }



}


