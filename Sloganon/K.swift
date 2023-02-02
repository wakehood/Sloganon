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
        static let stepCopyrightCellIdentifier = "StepCopyrightCell"
        static let webPageInfoCellIdentifier = "webPageInfoCell"

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
        static let webinfo = 0
    }
    
    struct RowHeight{
        static let sloganOfTheDay = 130.0
        static let slogans = 60.0
        static let acronyms = 150.0
        static let steps = 175.0
        static let stepsCopyright = 100.0
        static let webinfo = 100.0
    }
    
    struct HeaderText {
        static let sloganOfTheDay = "Slogan of the Day"
        static let slogans = "Slogans"
        static let acronyms = "Acronyms"
        static let _12Steps = "The 12 Steps"
        static let webinfo = "Alanon Websites for Further Info"
    }
    
    static let HeaderHeight = 50.0
    static let CopyrightHeaderHeight = 0.0
    
    static let serenityPrayer =
    "God grant me the serenity\nTo accept the things I cannot change,\nCourage to change the things I can\nAnd wisdom to know the difference."
    
    struct accessoryViewIcon {
        static let selectedSlogan   = "heart.fill"
        static let unselectedSlogan = "heart"
    }
    
    
    struct Color {
        static let sloganOfTheDay = UIColor.checkColor(named: "SloganOfTheDayColor")
        static let slogan =         UIColor.checkColor(named: "SloganColor")
        static let acronym =        UIColor.checkColor(named: "AcronymColor")
        
        static let step =           UIColor.checkColor(named: "StepColor")
        static let webinfo =        UIColor.checkColor(named: "WebInfoColor")
    }

    static let sloganVCbackground = UIColor.systemGray3
    static let stepVCBackground =   UIColor.systemGray3
    static let webInfoVCBackground =   UIColor.systemGray3
    
    struct HeaderBackgroundColor {
        static let sloganOfTheDay = Color.sloganOfTheDay.darken(byPercentage: 0.25)
        static let slogan =         Color.slogan.darken(byPercentage: 0.25)
        static let acronym =        Color.acronym.darken(byPercentage: 0.25)
        
        static let step =           Color.step.darken(byPercentage: 0.25)
        
        static let webinfo = Color.webinfo.darken(byPercentage: 0.25)
    }
    
    struct CellBackgroundColor {
        static let sloganOfTheDay = Color.sloganOfTheDay
        static let slogan =         Color.slogan
        static let acronym =        Color.acronym
        
        static let step =           Color.step
        static let webinfo =        Color.webinfo
    }
    
    struct CellContentColor {
        static let sloganOfTheDay = Color.sloganOfTheDay
        static let slogan =         Color.slogan
        static let acronym =        Color.acronym
        
        static let step =           Color.step
        static let webinfo =        Color.webinfo
    }
    
    static let secsInDay = 24 * 60 * 60
    
    
    //default list of acronyms
    static let sloganList = [
        "Detachment not Amputation ",
        "Look back without staring ",
        "If in Doubt, Don’t ",
        "This Too Shall Pass ",
        "Obedience to the Unenforceable ",
        "Live at Peace with Ourselves & Others ",
        "Take Care of Yourself ",
        "Quiet the Mind, Open the Heart ",
        "Together We Can Make It ",
        "The Healing is in the Hearing ",
        "Keep the Focus on Yourself ",
        "Take your Own Inventory (not someone elses) ",
        "Keep Coming Back ",
        "Feelings Aren’t Facts ",
        "Foster an Attitude of Gratitude ",
        "Forgive or Relive ",
        "Anger is just one letter short of Danger ",
        "Forgiveness is giving up Hope for a better past ",
        "Principles above Personalities ",
        "An Expectation is a resentment waiting to happen ",
        "The voice of my Higher Power can’t be heard if I’m doing all the talking ",
        "Participation is the key to Harmony ",
        "Ask Yourself - Would you rather be right or be happy? ",
        "My mind is like a bad neighborhood - I should never go there alone ",
        "Doing service is like getting on the super highway to recovery ",
        "Pain is inevitable. Suffering is optional ",
        "Success is getting what you want. Happiness is wanting what you get. ",
        "It’s impossible to be resentful and grateful at the same time ",
        "\"No\" is a complete sentence ",
        "Acceptance has to occur before change can occur ",
        "Are you seeing the disease or the person? ",
        "The elevator to recovery is broken; please use the Steps instead ",
        "But for the Grace of God ",
        "Easy Does It ",
        "First Things First ",
        "How Important is It? ",
        "Just for Today ",
        "Keep an Open Mind ",
        "Let Go and Let God ",
        "Let it Begin with Me ",
        "Listen and Learn ",
        "Live and Let Live ",
        "One Day at a Time ",
        
    ]

    //default list of acronyms
    static  let acronymList = [
        "THREE A'S\n\tAwareness\n\tAcceptance\n\tAction",
        "THREE C’s\n\tI didn’t cause it\n\tI can’t control it\n\tI can’t cure it",
        "THREE UNWANTED P’s\n\tPerfectionism\n\tProcrastination\n\tParalysis",
        "THREE G’s\n\tGet off their back\n\tGet out of their way\n\tGet on with your life",
        "FOUR UNWANTED M’s\n\tMartyrdom\n\tManaging\n\tManipulating\n\tMothering",
        "THE STEPS, CONDENSED\n\t1-3 Peace with God\n\t4-7 Peace with Ourself\n\t8-10 Peace with Others\n\t1 1-12\tKeeping the Peace",
        "HALT IF YOU’RE\n\tHungry\n\tAngry\n\tLonely\n\tTired",
        "THINK - Is it.....?\n\tThoughtful\n\tHonest\n\tIntelligent\n\tNecessary\n\tKind",
        "FEAR\n\tFalse\n\tEvidence\n\tAppearing\n\tReal",
        "HOPE\n\tHappy\n\tOur\n\tProgram\n\tExists",
        "NUTS\n\tNot\n\tUsing\n\tThe\n\tSteps",
        "DETACH\n\tDon’t\n\tEven \n\tThink\n\tAbout\n\tChanging Him/Her",
        "HOW\n\tHonest\n\tOpen\n\tWilling",
        "STEPS\n\tSolutions\n\tTo\n\tEvery\n\tProblem",
        "QTIP\n\tQuit\n\tTaking\n\tIt\n\tPersonally",
        "DENIAL\n\tDon’t\n\tEven\n\tNotice\n\tI\n\tAm \n\tLying"
    ]
    
    static let stepsCopyright = "© Al-Anon’s Twelve Steps, copyright 1996 by Al-Anon Family Group Headquarters, Inc. Reprinted with permission of Al-Anon Family Group Headquarters, Inc."
    
    //starting list of web pages
    static let elementsPerWebPageInfo = 3
        
    static let webPages = [
        ["World Service Organization", "US", "https://www.al-anon.org"],
        ["Arizona Al-Anon/Alateen Family Groups", "AZ", "https://al-anon-az.org/"],
        
        ["East Valley Al-Anon Information Center (EVIC)", "AZ", "http://al-anoneastvalley.org/"],
       
        ["Grand Rapids Al-Anon", "MI", "https://aisgr.org/"],
        ["Al-Anon and Alateen Family Groups of Utah", "UT", "https://utah-alanon.org/"],
        ["Texas Al-Anon and Alateen", "TX", "https://texas-al-anon.org/"],
        ["Al-Anon Suffolk ", "NY", "https://www.al-anon-suffolk-ny.org/"],
        ["Al-Anon Baltimore", "MD", "https://www.alanon-maryland.org/"],
        ["Florida North Alanon", "FL", "https://www.afgarea9.org/"],
        ["Southern Arizona Al-Anon and Alateen", "AZ", "https://so-az-alanon.org/"],
        ["New Jersey Al-Anon/Alateen", "NJ", "https://nj-al-anon.org/"],
        ["Rhode Island Al-Anon Family Groups", "RI", "https://www.riafg.org/"],
        ["Al-Anon Information Services of Oklahoma", "OK", "https://www.okcalanon.org/"],
        ["Alabama, Northwest Florida Al-Anon & Alateen","AL","http://www.alnwfl-al-anon.org"],
        ["Alabama, Northwest Florida Al-Anon & Alateen","FL","http://www.alnwfl-al-anon.org"],
        ["The Greater Birmingham Al-Anon and Alateen Family Groups","AL","https://bham-al-anon.com"],
        ["Al-Anon Montgomery Alabama","AL","https://aldistrict6afg.org"],
        ["Alaska Al-Anon Family Groups","AK","https://al-anon-ak.org"],
        ["Arizona Al-Anon / Alateen Family Groups","AZ ","https://al-anon-az.org/"],
        
        
        ["Al-Anon Alateen in Northern California","CA","https://northerncaliforniaal-anon.org/"],
        ["Al-Anon Family Groups of Greater Los Angeles","CA","https://alanonla.org/"],
        ["Al-Anon/Alateen Southern California World Service","CA","https://www.scws-al-anon.org/"],
        ["Al-Anon Family Groups Information Services of Orange County","CA","https://www.ocalanon.org/"],
        ["Al-Anon San Diego","CA","https://www.alanonsandiego.org/"],
        ["Inland Empire of California Al-Anon and Alateen","CA","https://iealanon.org/"],
        ["Ventura County Al-Anon Family Groups","CA","https://www.alanonventura.org/"],
        ["Al-Anon in the Desert","CA","https://www.alanoninthedesert.com/"],
        ["AL-Anon / Alateen of the Mid-Peninsula","CA","https://alanonmidpeninsula.org/"],
        ["Al-Anon Family Groups Santa Clara Valley","CA","https://www.scv-afg.org/"],
        ["Al-Anon / Alateen for Santa Cruz and San Benito Counties","CA","https://district23alanon.org/"],
        ["Al-Anon by the Bay","CA","https://al-anonbythebay.org/"],
        ["Al-Anon Family Groups of Central Valley","CA","https://southvalleyalanon.org/"],
        ["AL-ANON GREATER TEMECULA & SW RIVERSIDE CO","CA","https://al-anonriverside.org/"],
        ["Al-Anon District 15 Oakland-Hayward","CA","https://ncwsadistrict15.org/"],
        ["Al-Anon District 3 San Luis Obispo and Northern Santa Barbara Counties","CA","https://al-anoncacentralcoast.org/"],
        ["Al-Anon / Alateen District 11 Marin","CA","https://marinal-anon.org/"],
        ["Al-Anon Kern County","CA","https://www.kernal-anon.org/"],
        ["Northern Peninsula Al-Anon","CA","https://www.peninsula-alanonalateen.org/"],
        ["San Joaquin Valley Al-anon","CA","https://alanonsanjoaquinvalley.org/"],
        ["Al-Anon Family Groups of Great Long Beach","CA","https://al-anonlongbeach.org/"],
        ["Sonoma and Napa Alanon", "CA", "https://sonapal-anon.org"],
        ["Al-Anon and Alateen Santa Barbara", "CA", "https://www.alanonsantabarbara.info/"],
        ["Monterey County Al-Anon", "CA", "https://www.montereycountyal-anon.org/"],
    ]
}



