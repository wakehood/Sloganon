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
               
        labelsView.layout(top:self.topAnchor, leading:self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 5, left: 10, bottom: 5, right: 10))


        stepNumberLabel.textAlignment = .center
        stepNumberLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        labelsView.addSubview(stepNumberLabel)
        stepNumberLabel.layout(top: labelsView.topAnchor, leading:labelsView.leadingAnchor, bottom: labelsView.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 40, height: 0))
        
        

        stepLabel.numberOfLines = 0
        stepLabel.minimumScaleFactor = 0.5
        stepLabel.font = UIFont.systemFont(ofSize: 20.0)
        
        labelsView.addSubview(stepLabel)
                
        stepLabel.layout(top: labelsView.topAnchor, leading:stepNumberLabel.trailingAnchor, bottom: labelsView.bottomAnchor, trailing: labelsView.trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 10), size: .init(width: 0, height: 0))

        self.configure(configuration: configuration)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? StepContentConfiguration else { return }
        self.stepNumberLabel.text = configuration.stepNum
        self.stepLabel.text = configuration.step
        
        let color = K.CellContentColor.step.darken(byPercentage: configuration.percentageBy)
        self.stepNumberLabel.textColor = color.contrastingColor(isFlat: false)
        self.stepNumberLabel.backgroundColor = color
        self.stepLabel.textColor = color.contrastingColor(isFlat: false)
        self.stepLabel.backgroundColor = color
        self.labelsView.backgroundColor = color
    }
}

struct StepContentConfiguration : UIContentConfiguration {
    var stepNum = ""
    var step = ""
    var percentageBy = 0.0
    
    func makeContentView() -> UIView & UIContentView {
        return StepContentView(self)
    }
    func updated(for state: UIConfigurationState) -> StepContentConfiguration {
        return self
    }
}
