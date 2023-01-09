//
//  stepContentConfiguration.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/4/23.
//

import Foundation
import UIKit


class StepContentView : UIView, UIContentView {
    var configuration: UIContentConfiguration {
        didSet {
            self.configure(configuration: configuration)
        }
    }
    var labelsView = UIView()
    var stepNumberLabel = UILabel()
    var stepLabel = UILabel()
    
    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame:.zero)
        
        self.addSubview(labelsView)
        
        labelsView.backgroundColor = UIColor.systemGreen
        labelsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelsView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            labelsView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            labelsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            labelsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])

        stepNumberLabel.backgroundColor = UIColor.systemPurple
        stepNumberLabel.textAlignment = .center
        stepNumberLabel.translatesAutoresizingMaskIntoConstraints   = false
        
        labelsView.addSubview(stepNumberLabel)
        
        stepLabel.backgroundColor = UIColor.systemGreen
        stepLabel.numberOfLines = 0
        stepLabel.minimumScaleFactor = 0.5
        
        stepLabel.translatesAutoresizingMaskIntoConstraints   = false

        labelsView.addSubview(stepLabel)
        
        NSLayoutConstraint.activate([
            stepNumberLabel.topAnchor.constraint(equalTo: labelsView.topAnchor, constant: 0),
            stepNumberLabel.bottomAnchor.constraint(equalTo: labelsView.bottomAnchor, constant: 0),
            stepNumberLabel.leadingAnchor.constraint(equalTo: labelsView.leadingAnchor, constant: 0),
            stepNumberLabel.widthAnchor.constraint(equalToConstant: 40),
        ])
        
        NSLayoutConstraint.activate([
            stepLabel.topAnchor.constraint(equalTo: labelsView.topAnchor, constant: 0),
            stepLabel.bottomAnchor.constraint(equalTo: labelsView.bottomAnchor, constant: 0),
            stepLabel.leadingAnchor.constraint(equalTo: stepNumberLabel.trailingAnchor, constant: 10),
            stepLabel.trailingAnchor.constraint(equalTo: labelsView.trailingAnchor, constant: 0)
        ])

        self.configure(configuration: configuration)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? StepContentConfiguration else { return }
        self.stepNumberLabel.text = configuration.stepNum
        self.stepLabel.text = configuration.step
    }
}

struct StepContentConfiguration : UIContentConfiguration {
    var stepNum = ""
    var step = ""
    func makeContentView() -> UIView & UIContentView {
        return StepContentView(self)
    }
    func updated(for state: UIConfigurationState) -> StepContentConfiguration {
        return self
    }
}
