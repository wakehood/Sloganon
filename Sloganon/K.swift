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
        static let sloganOfTheDay = 130.0
        static let slogans = 60.0
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
    
    
    struct Color {
        static let sloganOfTheDay = UIColor.checkColor(named: "SloganOfTheDayColor")
        static let slogan =         UIColor.checkColor(named: "SloganColor")
        static let acronym =        UIColor.checkColor(named: "AcronymColor")
        
        static let step =           UIColor.checkColor(named: "StepColor")
    }

    static let sloganVCbackground = UIColor.checkColor(named: "SloganBackgroundColor")
    static let stepVCBackground =   UIColor.checkColor(named:"StepBackgroundColor")
    
    struct HeaderBackgroundColor {
        static let sloganOfTheDay = Color.sloganOfTheDay.darken(byPercentage: 0.25)
        static let slogan =         Color.slogan.darken(byPercentage: 0.25)
        static let acronym =        Color.acronym.darken(byPercentage: 0.25)
        
        static let step =           Color.step.darken(byPercentage: 0.25)
    }
    
    struct CellBackgroundColor {
        static let sloganOfTheDay = Color.sloganOfTheDay
        static let slogan =         Color.slogan
        static let acronym =        Color.acronym
        
        static let step =           Color.step
    }
    
    struct CellContentColor {
        static let sloganOfTheDay = Color.sloganOfTheDay
        static let slogan =         Color.slogan
        static let acronym =        Color.acronym
        
        static let step =           Color.step
    }
    


}

//func checkColor(named: String) -> UIColor{
//    if let color = UIColor(named:named) {
//        return color
//    } else {
//        print("No Color found")
//        return UIColor.white
//    }
//}




