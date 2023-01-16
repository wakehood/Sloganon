//
//  Slogans.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 9/22/22.
//
import UIKit
import Foundation
import RealmSwift

class SlogansAndAcronyms {
    //let realm = try! Realm()
    
    //This function should only be called the first time the app is run
    static func initalizeSlogans(){
        let realm = try! Realm()
        do {
            //don't add slogans twice - this is belt and suspenders
            let sloganResults = realm.objects(Slogan.self)
            if sloganResults.count != 0 {
                //also check if results count is the same as the list count
                if(sloganResults.count != K.sloganList.count){
                    print ("unexpected number of slogans; expect \(K.sloganList.count) but have \(sloganResults.count)")
                }
                return
            }
            try realm.write {
                for item in K.sloganList {
                    let slogan = Slogan(slogan: item, isFavorite: false, isDeletable: false)
                    realm.add(slogan)
                }
            }
        } catch {
            print("Error adding slogans \(error)")
        }
    }
    
    //This function should only be called the first time the app is run
    static func initalizeAcronyms(){
        let realm = try! Realm()
        do {
            //don't add acronyms twice - this is belt and suspenders
            let acronymResults = realm.objects(Acronym.self)
            if acronymResults.count != 0 {
                //also check if results count is the same as the list count
                if(acronymResults.count != K.acronymList.count){
                    print ("unexpected number of acronyms; expect \(K.acronymList.count) but have \(acronymResults.count)")
                }
                return
            }
            try realm.write {
                for item in K.acronymList {
                    let acronym = Acronym(acronym: item,isFavorite: false, isDeletable: false)
                    realm.add(acronym)
                }
            }
        } catch {
            print("Error adding acronyms \(error)")
        }
    }
    
    //Returns a String array of all the slogans and acronyms
    static func sloganAndAcronymList() -> Array<String>
    {
        let realm = try! Realm()
        
        //use map function to get String array
        let sloganArray = Array(realm.objects(Slogan.self).sorted(byKeyPath: "slogan")).map{$0.slogan}
        
        
//        let acronymArray = Array(realm.objects(Acronym.self).sorted(byKeyPath: "acronym")).map{$0.acronym}
        
//        let combinedArray = sloganArray + acronymArray
        
        return sloganArray
    }
    
    //return a random number from 0 to size of list - 1
    static func getRandomSlogan()-> String {
        let sayingslist = sloganAndAcronymList()
        let listSize = sayingslist.count
        let index = Int.random(in: 0...(listSize-1))
        
        return sayingslist[index]
    }
    
    static func getSloganOfTheDay() -> String {
        //get total number of seconds since 1970
        let timezoneOffset =  TimeZone.current.secondsFromGMT()
        let interval = NSInteger(NSDate().timeIntervalSince1970) + timezoneOffset
                
        //get days since 1970
        let days = interval / K.secsInDay
        
        //get the sayings list
        let sayingslist = sloganAndAcronymList()
        
        //get the modulus
        let index = (days % sayingslist.count)

        let slogan = sayingslist[index]
        
        return slogan
    }
    
//    func searchSlogans(keyword: String) -> String{
//
//        var found = false
//        var combinedSlogan = ""
//
//        //clean up the keyword; remove whitespace; make lowercase
//        let cleanKeyword = keyword.lowercased().trimmingCharacters(in: .whitespaces)
//
//        for s in sloganList {
//            //convert slogan to array of strings
//            let strArray = s.lowercased().removingCharacters(from: .newlines).components(separatedBy: " ")
//            let wordFound = strArray.contains(cleanKeyword.lowercased())
//            if(wordFound){
//                combinedSlogan += s + "\n"
//                found = true
//            }
//        }
//        if(!found){
//            combinedSlogan = "No slogan was found with keyword \"\(keyword)\""
//        }
//        return combinedSlogan
//    }
    
    static func sortedSloganList() -> Array<Slogan> {
        let realm = try! Realm()
        
        let sloganResults = realm.objects(Slogan.self)
            .sorted(byKeyPath: "slogan")
        let sloganArray = Array(sloganResults)
        
        return sloganArray
    }
    
    static func sortedAcronymList() -> Array<Acronym> {
        let realm = try! Realm()
        
        let acronymResults = realm.objects(Acronym.self)
            .sorted(byKeyPath: "acronym")
        let acronymArray = Array(acronymResults)
        
        return acronymArray
    }
    
}


