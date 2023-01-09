//
//  K.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/1/23.
//

import Foundation
import UIKit

struct K {

    //cell nib names
    struct CellNibNames{
        static let sloganOfTheDayCellNibName = "SloganOfTheDayTableViewCell"
        static let acronymCellNibName = "AcronymTableViewCell"
    }
    
    //cell reuse identifiers
    struct CellReuseIdentifiers{
        static let sloganOfTheDayCellIdentifier = "SloganOfTheDayCell"
        static let sloganCellIdentifier = "SloganCell"
        static let acronymCellIdentifier = "AcronymCell"
        static let stepCellIdentifier = "StepCell"

    }

    struct ViewControllers{
        static let sloganViewControllerTitle = "Slogans"
        static let serenityViewControllerTitle = "SerenityPrayer"
        static let stepsViewControllerTitle = "Steps"
        static let infoViewControllerTitle = "Info"
    }
    
    struct SectionNumber{
        static let sloganOfTheDay = 0
        static let slogans = 1
        static let acronyms = 2
        static let steps = 0
    }
    
    struct RowHeight{
        static let sloganOfTheDay = 100.0
        static let slogans = 50.0
        static let acronyms = 128.0
        static let steps = 175.0
    }
    
    struct HeaderText {
        static let sloganOfTheDay = "Slogan or Acronym of the Day"
        static let slogans = "Slogans"
        static let acronyms = "Acronyms"
        static let _12Steps = "The 12 Steps"
    }
    
    static let HeaderHeight = 50.0
    
    static let serenityPrayer =
    "God grant me the serenity\nTo accept the things I cannot change,\nCourage to change the things I can\nAnd wisdom to know the difference."
    
    struct HeaderBackgroundColors {
        static let sloganOfTheDay = UIColor(red: 0.87, green: 0.98, blue: 0.98, alpha: 1.00)
        static let slogan = UIColor(red: 0.96, green: 0.90, blue: 0.55, alpha: 1.00)
        static let acronym = UIColor(red: 0.60, green: 0.93, blue: 0.86, alpha: 1.00)
    }

}
