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
        static let addWebPageInfoNibName = "AddWebPageTableViewCell"
    }
    
    //cell reuse identifiers
    struct CellReuseIdentifiers{
        static let sloganOfTheDayCellIdentifier = "SloganOfTheDayCell"
        static let choiceCellIdentifier = "ChoiceCell"
        static let favoritesCellIdentifier = "FavoritesCell"
        
        static let slogansayingAcronymCellIdentifier = "sloganSayingOrAcronymCell"
        
        static let stepCellIdentifier = "StepCell"
        static let stepsReferenceCellIdentifiers = "StepsReferenceCell"
        
        static let webPageInfoCellIdentifier = "webPageInfoCell"
        static let addWebPageInfoIdentifier = "AddWebPageCell"

    }
    

    struct ViewControllers{
        static let sloganViewControllerTitle = "Slogans"
        static let serenityViewControllerTitle = "SerenityPrayer"
        static let stepsViewControllerTitle = "Steps"
        static let infoViewControllerTitle = "Info"
    }
    
    struct SectionNumber{
        static let sloganOfTheDay = 0
        static let slogansSayingsOrAcronyms = 1
        static let favorites = 2
        static let steps = 0
        static let webinfo = 0
    }
    
    struct SloganSayingorAcronymCells {
        static let slogans = "Slogans"
        static let sayings = "Sayings"
        static let acronyms = "Acronyms"
    }
    
    struct RowHeight{
        static let sloganOfTheDay = 130.0
        static let slogans = 60.0
        static let acronyms = 175.0
        static let steps = 175.0
        static let stepsCopyright = 100.0
        static let webinfo = 100.0
    }
    
    struct HeaderText {
        static let sloganOfTheDay = "Daily Sloganon"
        static let sloganSayingsOrAcronyms = "Slogans, Sayings & Acronyms"
        static let favorites = "My Favorites"
        
        static let slogans = "Slogans"
        static let sayings = "Sayings"
        static let acronyms = "Acronyms"
        
        static let _12Steps = "The 12 Steps"
        
        static let webinfo1 = "Websites for Further Info"
        static let webinfo2 = "Add Your Own Website"
    }
    
    static let HeaderFont = UIFont(name: "Rockwell", size: 24)
    static let SegueIdentifier = "goToSlogansSayingsOrAcronyms"
    static let newSegueIdentifier = "goToSSOAViewController"
    
    static let HeaderHeight = 50.0
    static let StepsReferenceHeaderHeight = 0.0
    
    static let serenityPrayer =
    "God grant me the serenity\nTo accept the things I cannot change,\nCourage to change the things I can\nAnd wisdom to know the difference."
    
    struct accessoryViewIcon {
        static let selectedSlogan   = "heart.fill"
        static let unselectedSlogan = "heart"
        static let addWebInfo       = "plus"
    }
    
    
    struct Color {
        static let sloganOfTheDay   = UIColor.checkColor(named: "SloganOfTheDayColor")
        static let ssoa             = UIColor.checkColor(named: "SloganColor")
        static let favorites        = UIColor.checkColor(named: "FavoritesColor")
        
        static let step             = UIColor.checkColor(named: "StepColor")
        static let webinfo          = UIColor.checkColor(named: "WebInfoColor")
    }

    static let sloganVCbackground   = UIColor.systemGray3
    static let stepVCBackground     = UIColor.systemGray3
    static let webInfoVCBackground  = UIColor.systemGray3
    
    static let webInputCursorColor = Color.webinfo.darken(byPercentage: 0.50)
    
    struct HeaderBackgroundColor {
        static let sloganOfTheDay   = Color.sloganOfTheDay.darken(byPercentage: 0.25)
        static let ssoa             = Color.ssoa.darken(byPercentage: 0.25)
        static let favorites        = Color.favorites.darken(byPercentage: 0.25)
        
        static let step             = Color.step.darken(byPercentage: 0.25)
        
        static let webinfo          = Color.webinfo.darken(byPercentage: 0.25)
    }
    
    struct CellBackgroundColor {
        static let sloganOfTheDay   = Color.sloganOfTheDay.lighten(byPercentage: 0.10)
        static let ssoa             = Color.ssoa
        static let favorites        = Color.favorites
        
        static let step             = Color.step
        static let webinfo          = Color.webinfo
    }
    
    struct CellContentColor {
        static let sloganOfTheDay   = Color.sloganOfTheDay.lighten(byPercentage: 0.10)
        static let ssoa             = Color.ssoa
        static let favorites        = Color.favorites
        
        static let step             = Color.step
        static let webinfo          = Color.webinfo
    }
    
    static let secsInDay = 24 * 60 * 60
    
    
    //default list of acronyms
    static let sloganList = [
        "But for the Grace of God ",
        "Easy Does It ",
        "First Things First ",
        "How Important is It? ",
        "Just for Today ",
        "Keep an Open Mind ",
        "Keep Coming Back ",
        "Keep it Simple",
        "Let Go and Let God ",
        "Let it Begin with Me ",
        "Listen and Learn ",
        "Live and Let Live ",
        "One Day at a Time ",
        "Progress not Perfection",
        "Together We Can Make It ",
    ]
    
    static let sayingsList = [
        "Detachment not Amputation ",
        "Look back without staring ",
        "If in Doubt, Don’t ",
        "This Too Shall Pass ",
        "Obedience to the Unenforceable ",
        "Live at Peace with Ourselves & Others ",
        "Take Care of Yourself ",
        "Quiet the Mind, Open the Heart ",
        "The Healing is in the Hearing ",
        "Keep the Focus on Yourself ",
        "Take your Own Inventory (not someone elses) ",
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
    
    static let stepsReference = "\"Twelve-step program.\" Wikipedia, Wikimedia Foundation, 24 April 2023, https://en.wikipedia.org/wiki/Twelve-step_program#Twelve_Steps."
    static let referenceNumber = "[1]"
    
    //starting list of web pages
    static let elementsPerWebPageInfo = 2
        
    static let webPages = [
        ["World Service Office", "https://www.al-anon.org"],
        ["Al-Anon Alateen in Northern California", "https://northerncaliforniaal-anon.org/"],
        ["Sonoma and Napa Alanon",   "https://sonapal-anon.org"],
    ]
}



