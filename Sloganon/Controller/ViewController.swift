//
//  ViewController.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 9/16/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var sloganLabel: UILabel!
    @IBOutlet weak var sloganOfTheDayButton: UIButton!
    @IBOutlet weak var surpriseMeButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    var slogans = Slogans()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sloganLabel.text = slogans.getSloganOfTheDay()
        self.searchTextField.delegate = self
 
    }
    
    @IBAction func sloganOfTheDayButtonPushed(_ sender: UIButton) {
        
        sloganLabel.text = slogans.getSloganOfTheDay()
    }
    
    @IBAction func surpriseMeButtonPushed(_ sender: UIButton) {
        
        sloganLabel.text = slogans.getRandomSlogan()

    }
    
    @IBAction func searchButtonPushed(_ sender: UIButton) {
        print("searchButton pushed")
        print(searchTextField.text ?? " ")
        let textField = searchTextField.text ?? " "
        let resultSlogan = slogans.searchSlogans(keyword: textField)
        sloganLabel.text = resultSlogan
    }
    
    @IBAction func searchTextFieldEditingDidEnd(_ sender: UITextField) {
        //print("editing did end")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
        {
            textField.resignFirstResponder()
            return true;
        }
    
}



