//
//  StepsViewController.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 12/22/22.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let labelsView = UIView()
        //var labelsView = UIView(frame: CGRect(x: 50, y: 100, width: 160, height: 100))
        labelsView.backgroundColor = UIColor.systemPink
        
        self.view.addSubview(labelsView)
        labelsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelsView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 250),
            labelsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -250),
            labelsView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            labelsView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
        ])
        
        let purpleLabel = UILabel()
        purpleLabel.backgroundColor = UIColor.systemPurple
        purpleLabel.translatesAutoresizingMaskIntoConstraints   = false
        
        labelsView.addSubview(purpleLabel)
        
        let greenLabel = UILabel()
        greenLabel.backgroundColor = UIColor.systemGreen
        greenLabel.translatesAutoresizingMaskIntoConstraints   = false
        
        labelsView.addSubview(greenLabel)
        
        NSLayoutConstraint.activate([
            purpleLabel.topAnchor.constraint(equalTo: labelsView.topAnchor, constant: 10),
            
            purpleLabel.bottomAnchor.constraint(equalTo: labelsView.bottomAnchor, constant: -10),
            
            purpleLabel.leadingAnchor.constraint(equalTo: labelsView.leadingAnchor, constant: 10),
            
            purpleLabel.widthAnchor.constraint(equalToConstant: 40),

        ])
        
        NSLayoutConstraint.activate([
            greenLabel.topAnchor.constraint(equalTo: labelsView.topAnchor, constant: 10),
            
            greenLabel.bottomAnchor.constraint(equalTo: labelsView.bottomAnchor, constant: -10),
            
            greenLabel.leadingAnchor.constraint(equalTo: purpleLabel.trailingAnchor, constant: 40),
            
            
            greenLabel.trailingAnchor.constraint(equalTo: labelsView.trailingAnchor, constant: -10)
        ])
        
    }

}
