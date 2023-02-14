//
//  AddWebPageContentConfiguration.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 2/13/23.
//

import Foundation
import UIKit


class AddWebPageContentView : UIView, UIContentView {
    var configuration: UIContentConfiguration {
        didSet {
            self.configure(configuration: configuration)
        }
    }
    var labelsView = UIView()
    var titleLabel = UILabel()
    var urlLabel = UILabel()
    
    
    
    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame:.zero)
        
        self.addSubview(labelsView)
               
        labelsView.layout(top:self.topAnchor, leading:self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 5, left: 10, bottom: 5, right: 10))
        
        labelsView.addSubview(titleLabel)
        
        
//        titleLabel.layout(top: labelsView.topAnchor, leading:labelsView.leadingAnchor, bottom: nil, trailing: labelsView.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 10, right: 0), size: .init(width: 0, height: 0))
        
    titleLabel.layout(top: labelsView.topAnchor, leading:labelsView.leadingAnchor, bottom: nil, trailing: labelsView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: K.RowHeight.webinfo))
        
        labelsView.addSubview(urlLabel)
        
//        urlLabel.layout(top: titleLabel.bottomAnchor, leading:labelsView.leadingAnchor, bottom: labelsView.bottomAnchor, trailing: labelsView.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10), size: .init(width: 0, height: K.RowHeight.webinfo))
        
        urlLabel.layout(top: nil, leading:labelsView.leadingAnchor, bottom: labelsView.bottomAnchor, trailing: labelsView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: K.RowHeight.webinfo))
        


        self.configure(configuration: configuration)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? AddWebPageContentConfiguration else { return }
        self.titleLabel.text = configuration.titleText
        self.urlLabel.text = configuration.urlText
        self.urlLabel.numberOfLines = 0
        self.urlLabel.minimumScaleFactor = 0.5
        self.urlLabel.font = UIFont.systemFont(ofSize: 25.0)
        self.titleLabel.textAlignment = .center
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        
        let color = configuration.cellColor.darken(byPercentage: configuration.percentageBy)
//        self.titleLabel.textColor = color.contrastingColor(isFlat: false)
//        self.titleLabel.backgroundColor = color
//        self.urlLabel.textColor = color.contrastingColor(isFlat: false)
//        self.urlLabel.backgroundColor = color
//        self.labelsView.backgroundColor = color
        
        self.titleLabel.textColor = UIColor.black
        self.titleLabel.backgroundColor = UIColor.red
        self.urlLabel.textColor = UIColor.black
        self.urlLabel.backgroundColor = UIColor.green
        self.labelsView.backgroundColor = UIColor.blue
    }
}

struct AddWebPageContentConfiguration : UIContentConfiguration {
    var titleText = ""
    var urlText = ""
    var cellColor = UIColor.white
    var percentageBy = 0.0
    
    func makeContentView() -> UIView & UIContentView {
        return AddWebPageContentView(self)
    }
    func updated(for state: UIConfigurationState) -> AddWebPageContentConfiguration {
        return self
    }
}
