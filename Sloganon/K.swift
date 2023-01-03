//
//  K.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/1/23.
//

import Foundation

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
        static let stepCellIdentifier = "StepCell"
        static let acronymCellIdentifier = "AcronymCell"
    }

    struct ViewControllers{
        static let sloganViewControllerTitle = "Slogans"
        static let serenityViewControllerTitle = "SerenityPrayer"
        static let stepsViewControllerTitle = "Steps"
        static let infoViewControllerTitle = "Info"
    }
    
    struct HeaderHeight{
        static let sloganOfTheDay = 100.0
        static let slogans = 50.0
        static let acronyms = 128.0
    }
    
    struct HeaderText {
        static let sloganOfTheDay = "Slogan or Acronym of the Day"
        static let slogans = "Slogans"
        static let acronyms = "Acronyms"
    }
}
