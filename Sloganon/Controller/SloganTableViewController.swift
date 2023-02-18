//
//  SloganTableViewController.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/1/23.
//

import UIKit
import RealmSwift


class SloganTableViewController: UITableViewController,  UITextFieldDelegate, SSOAViewControllerDelegate{

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
       
        //For dynamic row height
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.register(DailySloganTableViewCell.self, forCellReuseIdentifier: DailySloganTableViewCell.identifier)
        
        self.tableView.register(SloganonChoicesTableViewCell.self, forCellReuseIdentifier: SloganonChoicesTableViewCell.identifier)
        
        self.tableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: FavoritesTableViewCell.identifier)

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
                
        let percentageBy = UIColor.getPercentBy(row: indexPath.row, repeatEvery: 12)
        
        if section == K.SectionNumber.sloganOfTheDay {
            let cell = tableView.dequeueReusableCell(withIdentifier: DailySloganTableViewCell.identifier, for: indexPath) as! DailySloganTableViewCell

            cell.setColors(color: K.Color.sloganOfTheDay)
            cell.title = SloganSayingOrAcronym.getSloganOfTheDay()

            return cell
        } else if section == K.SectionNumber.slogansSayingsOrAcronyms {
            let cell  = tableView.dequeueReusableCell(withIdentifier: SloganonChoicesTableViewCell.identifier, for: indexPath) as! SloganonChoicesTableViewCell

            cell.title = sloganSayingsOrAcronymsSection[indexPath.row]
            cell.setColors(color: K.Color.ssoa)
            cell.darkenColor(byPercentage: percentageBy)
            
            return cell
        } else  {
            let cell  = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.identifier, for: indexPath) as! FavoritesTableViewCell
            
            cell.title = favorites?.count == 0 ? "You don't have any favorites yet. \n\n\u{2764} your favorite Slogans, Sayings or Acronyms!! " : favorites![indexPath.row].text
            cell.setColors(color: K.Color.favorites)
            cell.darkenColor(byPercentage: percentageBy)

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
        if indexPath.section == 1 {
            performSegue(withIdentifier: K.newSegueIdentifier, sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                
        if let indexPath = tableView.indexPathForSelectedRow {
            if indexPath.section == 1 {
                let destinationVC = segue.destination as! SSOAViewController
                
                destinationVC.delegate = self
                
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


