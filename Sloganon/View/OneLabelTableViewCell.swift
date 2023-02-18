//
//  OneLabelTableViewCell.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 2/17/23.
//

import UIKit

class OneLabelTableViewCell: UITableViewCell {
    var color = UIColor.white

    private let aLabel: UILabel = {
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

        contentView.addSubview(aLabel)
        
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        aLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        aLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        aLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
               
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //some public accessors to be able to get and set the title etc
    var title: String{
        set {
            self.aLabel.text = newValue
        }
        get { return self.aLabel.text!}
    }
    
    func setColors(color: UIColor) {
        self.color = color
        self.aLabel.backgroundColor = color
        self.aLabel.textColor = color.contrastingColor(isFlat: false)
        self.backgroundColor = color
        self.contentView.backgroundColor = color
    }
    
    func darkenColor(byPercentage: CGFloat){
        let currentColor = self.color
        self.setColors(color: currentColor.darken(byPercentage: byPercentage))
    }
    
    func setFont(font: UIFont) {
        self.aLabel.font = font
    }
}

// MARK: - The Web Page Info Cells on the Info tab
class WebPageInfoTableViewCell : OneLabelTableViewCell {
    static let identifier = "WebPageInfoTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
        self.setColors(color: K.CellContentColor.webinfo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - The Daily Slogan Cell on the Slogans Tab
class DailySloganTableViewCell : OneLabelTableViewCell {
    static let identifier = K.CellReuseIdentifiers.sloganOfTheDayCellIdentifier
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setColors(color: K.Color.sloganOfTheDay.lighten(byPercentage: 0.10))
        
        self.setFont(font: UIFont.boldSystemFont(ofSize: 25))
        self.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - The Choice of Slogans, Sayings or Acronyms Cells on the Slogans tab
class SloganonChoicesTableViewCell : OneLabelTableViewCell {
    static let identifier = K.CellReuseIdentifiers.choiceCellIdentifier
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setColors(color: K.Color.ssoa)
        
        self.setFont(font: UIFont.systemFont(ofSize: 25))
        
        self.accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - The Favorites Cells on the Slogans tab

class FavoritesTableViewCell : OneLabelTableViewCell {
    static let identifier = K.CellReuseIdentifiers.favoritesCellIdentifier
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setColors(color: K.Color.favorites)
        self.setFont(font: UIFont.systemFont(ofSize: 25))
        self.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - The Slogan Sayings or Acronyms Cells

class SlogansSayingOrAcronymsTableViewCell : OneLabelTableViewCell {
    static let identifier = K.CellReuseIdentifiers.slogansayingAcronymCellIdentifier
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setColors(color: K.Color.ssoa)
        self.setFont(font: UIFont.systemFont(ofSize: 25))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - The Steps Copyright Cell on the Steps tab

class StepsCopyrightTableViewCell : OneLabelTableViewCell {
    static let identifier = K.CellReuseIdentifiers.stepCopyrightCellIdentifier
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.title = K.stepsCopyright
        self.setColors(color: K.Color.step)
        self.darkenColor(byPercentage: 0.55)
        self.setFont(font: UIFont.systemFont(ofSize: 14))
        self.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
