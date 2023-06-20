//
//  TwoLabelsTableViewCell.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 2/17/23.
//

import UIKit

class TwoLabelsTableViewCell: UITableViewCell {
    var color = UIColor.white

    private let leftLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Label Text"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.font = UIFont.systemFont(ofSize: 25.0)
        
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        
        return label
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Label Text"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.font = UIFont.systemFont(ofSize: 25.0)
        
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide

        contentView.addSubview(leftLabel)
        
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        leftLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        leftLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        leftLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        leftLabel.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        contentView.addSubview(mainLabel)
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.leadingAnchor.constraint(equalTo: leftLabel.trailingAnchor).isActive = true
        mainLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        mainLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        mainLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //some public accessors to be able to get and set the title etc
    var leftTitle: String{
        set {
            self.leftLabel.text = newValue
        }
        get { return self.leftLabel.text!}
    }
    
    var mainTitle: String{
        set {
            self.mainLabel.text = newValue
        }
        get { return self.mainLabel.text!}
    }
    
    func setColors(color: UIColor) {
        self.color = color
        self.leftLabel.backgroundColor = color
        self.leftLabel.textColor = color.contrastingColor(isFlat: false)
        self.mainLabel.backgroundColor = color
        self.mainLabel.textColor = color.contrastingColor(isFlat: false)
        self.backgroundColor = color
        self.contentView.backgroundColor = color
        self.accessoryView?.backgroundColor = color
    }
    
    func darkenColor(byPercentage: CGFloat){
        let currentColor = self.color
        self.setColors(color: currentColor.darken(byPercentage: byPercentage))
    }
    
    func setLeftFont(font: UIFont) {
        self.leftLabel.font = font
    }
    func setMainFont(font: UIFont) {
        self.mainLabel.font = font
    }
}

// MARK: - The Steps Cell on the Steps tab

class StepsTableViewCell : TwoLabelsTableViewCell {
    static let identifier = K.CellReuseIdentifiers.stepCellIdentifier
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setColors(color: K.Color.step)
        self.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - The Steps Reference Cell on the Steps tab
class StepsRefTableViewCell : TwoLabelsTableViewCell {
    static let identifier = K.CellReuseIdentifiers.stepsReferenceCellIdentifiers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setColors(color: K.Color.step)
        self.darkenColor(byPercentage: 0.55)
        self.setMainFont(font: UIFont.systemFont(ofSize: 14))
        self.setLeftFont(font: UIFont.systemFont(ofSize: 10))
        self.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
