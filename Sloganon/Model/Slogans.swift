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
    ]
    
    let acronymList = [
        " THREE A'S\n\tAwareness\n\tAcceptance\n\tAction",
        " THREE C’s\n\tI didn’t cause it\n\tI can’t control it\n\tI can’t cure it",
        " THREE UNWANTED P’s\n\tPerfectionism\n\tProcrastination\n\tParalysis",
        " THREE G’s\n\tGet off their back\n\tGet out of their way\n\tGet on with your life",
        " FOUR UNWANTED M’s\n\tMartyrdom\n\tManaging\n\tManipulating\n\tMothering",
        " THE STEPS, CONDENSED\n\t1-3 Peace with God\n\t4-7 Peace with Ourself\n\t8-10 Peace with Others\n\t1 1-12\tKeeping the Peace",
        " HALT IF YOU’RE\n\tHungry\n\tAngry\n\tLonely\n\tTired",
        " THINK - Is it.....?\n\tThoughtful\n\tHonest\n\tIntelligent\n\tNecessary\n\tKind",
        " FEAR\n\tFalse\n\tEvidence\n\tAppearing\n\tReal",
        " HOPE\n\tHappy\n\tOur\n\tProgram\n\tExists",
        " NUTS\n\tNot\n\tUsing\n\tThe\n\tSteps",
        " DETACH\n\tDon’t\n\tEven \n\tThink\n\tAbout\n\tChanging\n\tHim/Her",
        " HOW\n\tHonest\n\tOpen\n\tWilling",
        " STEPS\n\tSolutions\n\tTo\n Every\n\tProblem",
        " QTIP\n\tQuit\n\tTaking\n\tIt\n\tPersonally",
        " DENIAL\n\tDon’t\n\tEven\n\tNotice\n\tI\n\tAm \n\tLying"
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


