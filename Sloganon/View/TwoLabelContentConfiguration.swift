//
//  TwoLabelContentConfiguration.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/24/23.
//

import Foundation
import UIKit


class TwoLabelContentView : UIView, UIContentView {
    var configuration: UIContentConfiguration {
        didSet {
            self.configure(configuration: configuration)
        }
    }
    var labelsView = UIView()
    var leftLabel = UILabel()
    var mainLabel = UILabel()
    
    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame:.zero)
        
        self.addSubview(labelsView)
               
        labelsView.layout(top:self.topAnchor, leading:self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 5, left: 10, bottom: 5, right: 10))

//        leftLabel.textAlignment = .center
//        leftLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        labelsView.addSubview(leftLabel)
        leftLabel.layout(top: labelsView.topAnchor, leading:labelsView.leadingAnchor, bottom: labelsView.bottomAnchor, trailing: nil, padding: .init(top: 10, left: 0, bottom: 10, right: 0), size: .init(width: 40, height: 0))
        

//        mainLabel.numberOfLines = 0
//        mainLabel.minimumScaleFactor = 0.5
//        mainLabel.font = UIFont.systemFont(ofSize: 20.0)
        
        labelsView.addSubview(mainLabel)
                
        mainLabel.layout(top: labelsView.topAnchor, leading:leftLabel.trailingAnchor, bottom: labelsView.bottomAnchor, trailing: labelsView.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10), size: .init(width: 0, height: 0))

        self.configure(configuration: configuration)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? TwoLabelContentConfiguration else { return }
        self.leftLabel.text = configuration.leftText
        self.mainLabel.text = configuration.mainText
        self.mainLabel.numberOfLines = 0
        self.mainLabel.minimumScaleFactor = 0.5
        self.mainLabel.font = UIFont.systemFont(ofSize: 25.0)
        self.leftLabel.textAlignment = .center
        self.leftLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        
        let color = configuration.cellColor.darken(byPercentage: configuration.percentageBy)
        self.leftLabel.textColor = color.contrastingColor(isFlat: false)
        self.leftLabel.backgroundColor = color
        self.mainLabel.textColor = color.contrastingColor(isFlat: false)
        self.mainLabel.backgroundColor = color
        self.labelsView.backgroundColor = color
    }
}

struct TwoLabelContentConfiguration : UIContentConfiguration {
    var leftText = ""
    var mainText = ""
    var cellColor = UIColor.white
    var percentageBy = 0.0
    
    func makeContentView() -> UIView & UIContentView {
        return TwoLabelContentView(self)
    }
    func updated(for state: UIConfigurationState) -> TwoLabelContentConfiguration {
        return self
    }
}
