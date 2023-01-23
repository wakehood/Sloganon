//
//  SloganTableViewController.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/1/23.
//

import UIKit
import RealmSwift

class SloganTableViewController: UITableViewController,  UITextFieldDelegate  {

    var slogans: Array<Slogan>?
    var acronyms: Array<Acronym>?
    
    let sections = [K.HeaderText.sloganOfTheDay,
                    K.HeaderText.slogans,
                    K.HeaderText.acronyms]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = K.sloganVCbackground
        
        slogans = Slogan.getSlogans()
        acronyms = Acronym.getAcronyms()
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == K.SectionNumber.sloganOfTheDay {
            return 1
        } else if section == K.SectionNumber.slogans {
            return self.slogans?.count ?? 1
        } else  {
            return self.acronyms?.count ?? 1
        }
    }

    // MARK: - Configure TableView Rows with delegate methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
                
        let percentageBy = UIColor.getPercentBy(row: indexPath.row)
        
        if section == K.SectionNumber.sloganOfTheDay {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.sloganOfTheDayCellIdentifier, for: indexPath)
            
            cell.contentConfiguration = SloganOfTheDayContentConfiguration(text: Slogan.getSloganOfTheDay())
            cell.backgroundColor =  K.CellBackgroundColor.sloganOfTheDay

            return cell
        } else if section == K.SectionNumber.slogans {
            let cell  = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.sloganCellIdentifier, for: indexPath)
            
            let slogan = slogans?[indexPath.row].slogan ?? "No slogans"
            let isFavorite = slogans?[indexPath.row].isFavorite ?? false
            
            cell.contentConfiguration = SloganContentConfiguration(text: slogan, percentageBy: percentageBy)
            cell.backgroundColor = K.CellBackgroundColor.slogan.darken(byPercentage: percentageBy)
            
            //set up the heart accessory view
            cell.accessoryType = (isFavorite) ? .checkmark : .none
            let heartImage = (isFavorite) ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
            let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
            imgView.image = heartImage
            cell.accessoryView = imgView

            return cell
        } else  {
            let cell  = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.acronymCellIdentifier, for: indexPath)
            
            let acronym = acronyms?[indexPath.row].acronym ?? "No acronyms"
            
            cell.contentConfiguration = AcronymContentConfiguration(text: acronym, percentageBy: percentageBy)
            cell.backgroundColor = K.CellBackgroundColor.acronym.darken(byPercentage: percentageBy)

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
        
        var cellColor = UIColor()
        
        if section == K.SectionNumber.sloganOfTheDay {
            cellColor = K.HeaderBackgroundColor.sloganOfTheDay
        } else if section == K.SectionNumber.slogans {
            cellColor = K.HeaderBackgroundColor.slogan
        } else {
            cellColor = K.HeaderBackgroundColor.acronym
        }
        
        let headerView = UIView().headerViewWithLabel(title: self.tableView(tableView, titleForHeaderInSection: section) ?? "", color: cellColor)

        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return K.HeaderHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let slogan = slogans?[indexPath.row]  {
            Slogan.toggleIsFavorite(slogan: slogan)
                  
            //update class member list
            slogans = Slogan.getSlogans()
          
            //update the tableview
            tableView.reloadData()
        }
    }
}


