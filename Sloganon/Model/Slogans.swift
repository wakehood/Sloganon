//
//  Slogans.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 9/22/22.
//
import UIKit
import Foundation

class Slogans {
    let secsInDay = 24 * 60 * 60
    let sloganList = [
        " Detachment not Amputation ",
        " Look back without staring ",
        " If in Doubt, Don’t ",
        " This Too Shall Pass ",
        " Obedience to the Unenforceable ",
        " Live at Peace with Ourselves & Others ",
        " Take Care of Yourself ",
        " Quiet the Mind, Open the Heart ",
        " Together We Can Make It ",
        " The Healing is in the Hearing ",
        " Keep the Focus on Yourself ",
        " Take your Own Inventory (not someone elses) ",
        " Keep Coming Back ",
        " Feelings Aren’t Facts ",
        " Foster an Attitude of Gratitude ",
        " Forgive or Relive ",
        " Anger is just one letter short of Danger ",
        " Forgiveness is giving up Hope for a better past ",
        " Principles above Personalities ",
        " An Expectation is a resentment waiting to happen ",
        " The voice of my Higher Power can’t be heard if I’m doing all the talking ",
        " Participation is the key to Harmony ",
        " Ask Yourself - Would you rather be right or be happy? ",
        " My mind is like a bad neighborhood - I should never go there alone ",
        " Doing service is like getting on the super highway to recovery ",
        " Pain is inevitable. Suffering is optional ",
        " Success is getting what you want. Happiness is wanting what you get. ",
        " It’s impossible to be resentful and grateful at the same time ",
        " “No” is a complete sentence ",
        " Acceptance has to occur before change can occur ",
        " Are you seeing the disease or the person? ",
        " The elevator to recovery is broken; please use the Steps instead ",
        " But for the Grace of God ",
        " Easy Does It ",
        " First Things First ",
        " How Important is It? ",
        " Just for Today ",
        " Keep an Open Mind ",
        " Let Go and Let God ",
        " Let it Begin with Me ",
        " Listen and Learn ",
        " Live and Let Live ",
        " One Day at a Time ",
        " Think ",
        " THREE A'S\n  Awareness\n Acceptance\n Action",
        " THREE C’s\n  I didn’t cause it\n I can’t control it\n I can’t cure it",
        " THREE UNWANTED P’s\n  Perfectionism\n Procrastination\n Paralysis",
        " THREE G’s\n  Get off their back\n Get out of their way\n Get on with your life",
        " FOUR UNWANTED M’s\n  Martyrdom\n Managing\n Manipulating\n Mothering",
        " THE STEPS, CONDENSED\n  1-3 Peace with God\n 4-7 Peace with Ourself\n 8-10 Peace with Others\n1 1-12 Keeping the Peace",
        " HALT IF YOU’RE\n Hungry\n Angry\n Lonely\n Tired",
        " THINK - Is it.....?\n Thoughtful\n Honest\n Intelligent\n Necessary\n Kind",
        " FEAR\n False\n Evidence\n Appearing\n Real",
        " HOPE\n Happy\n Our\n Program\n Exists",
        " NUTS\n Not\n Using\n The\n Steps",
        " DETACH\n Don’t\n Even\n Think\n  About\n Changing\n Him/Her",
        " HOW\n Honest\n Open\n Willing",
        " STEPS\n Solutions\n To\n Every\n Problem",
        " QTIP\n Quit\n Taking\n It\n Personally",
        " DENIAL\n Don’t\n Even\n Notice\n I\n Am\n Lying"
    ]

    //return a random number from 0 to size of list - 1
    func getRandomSlogan()-> String {
        let listSize = sloganList.count
        let index = Int.random(in: 0...(listSize-1))
        return sloganList[index]
    }
    
    func getSloganOfTheDay() -> String {
        let timezoneOffset =  TimeZone.current.secondsFromGMT()
        let interval = NSInteger(NSDate().timeIntervalSince1970) + timezoneOffset
                
        let days = interval / secsInDay
        let index = (days % sloganList.count)
        return sloganList[index]
    }
    
    func searchSlogans(keyword: String) -> String{
        
        var found = false
        var combinedSlogan = ""
        
        //clean up the keyword; remove whitespace; make lowercase
        let cleanKeyword = keyword.lowercased().trimmingCharacters(in: .whitespaces)
        
        for s in sloganList {
            //convert slogan to array of strings
            let strArray = s.lowercased().removingCharacters(from: .newlines).components(separatedBy: " ")
            let wordFound = strArray.contains(cleanKeyword.lowercased())
            if(wordFound){
                combinedSlogan += s + "\n"
                found = true
            }
        }
        if(!found){
            combinedSlogan = "No slogan was found with keyword \"\(keyword)\""
        }
        return combinedSlogan
    }    
}


