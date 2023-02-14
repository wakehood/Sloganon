//
//  SloganContentConfiguration.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/9/23.
//

import Foundation
import UIKit


struct OneLabelContentConfiguration : UIContentConfiguration {
    var text = ""
    var cellColor = UIColor.white
    var percentageBy = 0.0
    
    func makeContentView() -> UIView & UIContentView {
        return OneLabelContentView(self)
    }
    func updated(for state: UIConfigurationState) -> OneLabelContentConfiguration {
        return self
    }
}


class OneLabelContentView : UIView, UIContentView {
    var configuration: UIContentConfiguration {
        didSet {
            self.configure(configuration: configuration)
        }
    }
    let label = UILabel()
    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame:.zero)
        self.addSubview(self.label)


        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.layout(top:self.topAnchor, leading:self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        
        self.configure(configuration: configuration)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? OneLabelContentConfiguration else { return }
        self.label.text = configuration.text
        self.label.textAlignment = .left
        self.label.numberOfLines = 0
        self.label.minimumScaleFactor = 0.5
        self.label.font = UIFont.systemFont(ofSize: 25.0)

        let color = configuration.cellColor.darken(byPercentage: configuration.percentageBy)
        self.label.backgroundColor = color
        self.label.textColor = color.contrastingColor(isFlat: false)
        
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        
     //   self.roundCorners(corners: [.topLeft, .topRight], radius: 18)
   
    }
}
