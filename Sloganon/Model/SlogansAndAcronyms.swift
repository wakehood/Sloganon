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
        
    //return a random number from 0 to size of list - 1
    static func getRandomSlogan()-> String {
        let sayingslist = sortedSloganList()
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
        let sayingslist = sortedSloganList()
        
        //get the modulus
        let index = (days % sayingslist.count)

        let slogan = sayingslist[index]
        
        return slogan
    }
    

    
    static func sortedSloganList() -> Array<String> {
        let realm = try! Realm()
        
        //use map function to get String array
        let sloganArray = Array(realm.objects(Slogan.self)
            .sorted(byKeyPath: "slogan"))
            .map{$0.slogan}
        
        return sloganArray
    }
    
    static func sortedAcronymList() -> Array<String> {
        let realm = try! Realm()
        
        let acronymArray = Array(realm.objects(Acronym.self).sorted(byKeyPath: "acronym")).map{$0.acronym}
        
        return acronymArray
    }
    
}


