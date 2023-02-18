//
//  SlogansSayingOrAcronymsTableViewController.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 2/4/23.
//

import UIKit

protocol SlogansSayingOrAcronymsTableViewControllerDelegate : NSObjectProtocol {
    func updateDataAndTableview()
}

class SlogansSayingOrAcronymsTableViewController: UITableViewController {
    
    var selectedTitle = ""
    var arrayOfSelectedType : Array<SloganSayingOrAcronym>?
    
    weak var delegate : SlogansSayingOrAcronymsTableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        //For dynamic row height
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.register(SlogansSayingOrAcronymsTableViewCell.self, forCellReuseIdentifier: SlogansSayingOrAcronymsTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        navBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 25.0)]
        view.addSubview(navBar)

        let navItem = UINavigationItem(title: selectedTitle)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        
        doneItem.tintColor = K.HeaderBackgroundColor.ssoa

        navItem.rightBarButtonItem = doneItem


        navBar.setItems([navItem], animated: false)
        
       
        
    }
    
    @objc func done() {

        self.dismiss(animated: true)
        if let delegate = delegate{
            delegate.updateDataAndTableview()
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return arrayOfSelectedType?.count ??   1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SlogansSayingOrAcronymsTableViewCell.identifier, for: indexPath) as! SlogansSayingOrAcronymsTableViewCell

        let percentageBy = UIColor.getPercentBy(row: indexPath.row, repeatEvery: 10)
        
        let itemText = arrayOfSelectedType?[indexPath.row].text
        let isFavorite = arrayOfSelectedType?[indexPath.row].isFavorite
        
        cell.title = itemText!
        cell.setColors(color: K.Color.ssoa)
        cell.darkenColor(byPercentage: percentageBy)
        
        //set up the heart accessory view
        cell.accessoryType = (isFavorite ?? false) ? .checkmark : .none
        let heartImage = (isFavorite!) ?
        UIImage(systemName: K.accessoryViewIcon.selectedSlogan) :
        UIImage(systemName: K.accessoryViewIcon.unselectedSlogan)
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        imgView.image = heartImage
        cell.accessoryView = imgView

        return cell
    }
    
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
            tableView.deselectRow(at: indexPath, animated: true)
    
            if let slogan = arrayOfSelectedType?[indexPath.row]  {
                SloganSayingOrAcronym.toggleIsFavorite(ssoa: slogan)
        
                //update the tableview
                tableView.reloadData()
            }
        }
}
