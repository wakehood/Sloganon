//
//  SSOAViewController.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 2/17/23.
//

import UIKit

protocol SSOAViewControllerDelegate : NSObjectProtocol {
    func updateDataAndTableview()
}

class SSOAViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    var selectedTitle = ""
    var arrayOfSelectedType : Array<SloganSayingOrAcronym>?
    
    weak var delegate : SSOAViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        //For dynamic row height
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.register(SlogansSayingOrAcronymsTableViewCell.self, forCellReuseIdentifier: SlogansSayingOrAcronymsTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.doneButton.tintColor = K.HeaderBackgroundColor.ssoa
    }
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return arrayOfSelectedType?.count ??   1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)

        if let slogan = arrayOfSelectedType?[indexPath.row]  {
            SloganSayingOrAcronym.toggleIsFavorite(ssoa: slogan)
    
            //update the tableview
            tableView.reloadData()
        }
    }
    
    @IBAction func doneButtonPushed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
        if let delegate = delegate{
            delegate.updateDataAndTableview()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
