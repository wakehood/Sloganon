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
        
//        var trialGradientView = UIView()
//
//        self.view.addSubview(trialGradientView)
//        
//        trialGradientView.translatesAutoresizingMaskIntoConstraints   = false
//        NSLayoutConstraint.activate([
//            trialGradientView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
//            trialGradientView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -500),
//            trialGradientView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
//            trialGradientView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
//        ])
//
//        trialGradientView.addColorGradient(color1: UIColor.systemPink, color2: UIColor.systemGray)
        
        // Do any additional setup after loading the view.
        let labelsView = UIView()
        //var labelsView = UIView(frame: CGRect(x: 50, y: 100, width: 160, height: 100))
        labelsView.backgroundColor = UIColor.systemPink

   //     labelsView.addColorGradient(color1: UIColor.systemGreen, color2: UIColor.black)
        
        self.view.addSubview(labelsView)
        labelsView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            labelsView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 400),
            labelsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -150),
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
