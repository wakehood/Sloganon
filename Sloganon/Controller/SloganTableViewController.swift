//
//  SloganTableViewController.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/1/23.
//

import UIKit
import RealmSwift


class SloganTableViewController: UITableViewController,  UITextFieldDelegate, SlogansSayingOrAcronymsTableViewControllerDelegate{

    var slogans: Array<SloganSayingOrAcronym>?
    var sayings: Array<SloganSayingOrAcronym>?
    var acronyms: Array<SloganSayingOrAcronym>?
    var favorites: Array<SloganSayingOrAcronym>?

    
    let sections = [
        K.HeaderText.sloganOfTheDay,
        K.HeaderText.sloganSayingsOrAcronyms,
        K.HeaderText.favorites
    ]
    
    let sloganSayingsOrAcronymsSection = [
        K.SloganSayingorAcronymCells.slogans,
        K.SloganSayingorAcronymCells.sayings,
        K.SloganSayingorAcronymCells.acronyms
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
       // print("viewDidLoad")
        
   //     tableView.register(SloganTableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "headerView")


        self.view.backgroundColor = K.sloganVCbackground
        slogans = SloganSayingOrAcronym.getSlogans()
        sayings = SloganSayingOrAcronym.getSayings()
        acronyms = SloganSayingOrAcronym.getAcronyms()
        favorites = SloganSayingOrAcronym.getFavorites()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == K.SectionNumber.sloganOfTheDay {
            return 1
        } else if section == K.SectionNumber.slogansSayingsOrAcronyms {
            return sloganSayingsOrAcronymsSection.count
        } else  {
            if let favs =  self.favorites {
                return favs.count == 0 ? 1 : favs.count
            } else {
                return 0
            }
        }
    }

    // MARK: - Configure TableView Rows with delegate methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
                
        let percentageBy = UIColor.getPercentBy(row: indexPath.row, repeatEvery: 20)
        
        if section == K.SectionNumber.sloganOfTheDay {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.sloganOfTheDayCellIdentifier, for: indexPath)

            cell.contentConfiguration = SloganOfTheDayContentConfiguration(text: SloganSayingOrAcronym.getSloganOfTheDay())
            cell.backgroundColor =  K.CellBackgroundColor.sloganOfTheDay

            return cell
        } else if section == K.SectionNumber.slogansSayingsOrAcronyms {
            let cell  = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.choiceCellIdentifier, for: indexPath)
            
            let item = sloganSayingsOrAcronymsSection[indexPath.row]

            
            cell.contentConfiguration = OneLabelContentConfiguration(text: item, cellColor: K.CellContentColor.ssoa, percentageBy: percentageBy)
            cell.backgroundColor = K.CellBackgroundColor.ssoa.darken(byPercentage: percentageBy)
            
            cell.accessoryType = .disclosureIndicator

            return cell
        } else  {
            let cell  = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.favoritesCellIdentifier, for: indexPath)

//            let favorite = favorites?.count == 0 ? "You don't have any favorites Yet. \n\u{1F496} your favorite Slogans, Sayings or Acronyms!! " : favorites![indexPath.row].text
            
            let favorite = favorites?.count == 0 ? "You don't have any favorites Yet. \n\u{2764} your favorite Slogans, Sayings or Acronyms!! " : favorites![indexPath.row].text

            cell.contentConfiguration = OneLabelContentConfiguration(text: favorite,  cellColor: K.CellContentColor.favorites, percentageBy: percentageBy)
            cell.backgroundColor = K.CellBackgroundColor.favorites.darken(byPercentage: percentageBy)

            return cell
        }
    }
    
    
    // MARK: - Configure TableView Headers with delegate methods
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == K.SectionNumber.sloganOfTheDay {
            return K.HeaderText.sloganOfTheDay
        } else if section == K.SectionNumber.slogansSayingsOrAcronyms {
            return K.HeaderText.sloganSayingsOrAcronyms
        } else {
            return K.HeaderText.favorites
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

//        let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView")
//
//        headerCell?.contentConfiguration = OneLabelContentConfiguration(text: self.tableView(tableView, titleForHeaderInSection: section) ?? "", cellColor: K.HeaderBackgroundColor.sloganOfTheDay, percentageBy: 10.0)
//


//        var cellColor = UIColor()
//
//        if section == K.SectionNumber.sloganOfTheDay {
//            cellColor = K.HeaderBackgroundColor.sloganOfTheDay
//        } else if section == K.SectionNumber.slogansSayingsOrAcronyms {
//            cellColor = K.HeaderBackgroundColor.ssoa
//        } else {
//            cellColor = K.HeaderBackgroundColor.favorites
//        }

//        let headerView = UIView().headerViewWithLabel(title: self.tableView(tableView, titleForHeaderInSection: section) ?? "", color: cellColor)
        let headerView = UIView().headerViewWithLabel(title: self.tableView(tableView, titleForHeaderInSection: section) ?? "")
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return K.HeaderHeight
    }
    
    
    //Mark: - Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     //   tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: K.SegueIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! SlogansSayingOrAcronymsTableViewController
        
        destinationVC.delegate = self
        
        if let indexPath = tableView.indexPathForSelectedRow {
            switch indexPath.row {
            case 0:
                destinationVC.arrayOfSelectedType = slogans
                destinationVC.selectedTitle = K.HeaderText.slogans
            case 1:
                destinationVC.arrayOfSelectedType = sayings
                destinationVC.selectedTitle = K.HeaderText.sayings
            case 2:
                destinationVC.arrayOfSelectedType = acronyms
                destinationVC.selectedTitle = K.HeaderText.acronyms
            default:
                assertionFailure()
            }
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func updateDataAndTableview() {
        
        slogans = SloganSayingOrAcronym.getSlogans()
        sayings = SloganSayingOrAcronym.getSayings()
        acronyms = SloganSayingOrAcronym.getAcronyms()
        favorites = SloganSayingOrAcronym.getFavorites()
        
        tableView.reloadData()
    }
}


