//
//  SloganContentConfiguration.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/9/23.
//

import Foundation
import UIKit


struct SloganContentConfiguration : UIContentConfiguration {
    var text = ""
    var percentageBy = 0.0
    func makeContentView() -> UIView & UIContentView {
        return SloganContentView(self)
    }
    func updated(for state: UIConfigurationState) -> SloganContentConfiguration {
        return self
    }
}


class SloganContentView : UIView, UIContentView {
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
        
        label.layout(top:self.topAnchor, leading:self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 5, left: 10, bottom: 5, right: 10))
        
        self.configure(configuration: configuration)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? SloganContentConfiguration else { return }
        self.label.text = configuration.text
        label.textAlignment = .left
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5

        let color = K.CellContentColor.slogan.darken(byPercentage: configuration.percentageBy)
        self.label.backgroundColor = color
        self.label.textColor = color.contrastingColor(isFlat: false)
   
    }
}
