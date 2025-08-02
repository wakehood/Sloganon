//
//  Slogan.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 9/22/22.
//
import Foundation
import RealmSwift

enum SayingType : CustomStringConvertible{
    case slogan
    case aSaying
    case anAcronym
    case aMneumonic
    
    var description : String {
        switch self {
        case .slogan: return "Slogan"
        case .aSaying: return "Saying"
        case .anAcronym: return "Acronym"
        case .aMneumonic: return "Mneumonic"
        }
    }
}

class SloganSayingOrAcronym: Object{
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var type: String = ""
    @Persisted var text: String = ""
    @Persisted var isFavorite: Bool = false
    @Persisted var isDeletable: Bool = false
    
    convenience init(type: String = "", text: String = "", isFavorite: Bool = false, isDeletable: Bool = false) {
        self.init()
        self.type = type
        self.text = text
        self.isFavorite = isFavorite
        self.isDeletable = isDeletable
    }
    
    // MARK: - Initialization with default data
    //This function should only be called the first time the app is run
    static func initalizeSlogans(){
        let realm = try! Realm()
     
        //If realm db has never been intitialized do it now.
        if realm.objects(SloganSayingOrAcronym.self).isEmpty {
            do {
                try realm.write {
                    
                    for item in K.sloganList {
                        let slogan = SloganSayingOrAcronym(type: SayingType.slogan.description, text: item, isFavorite: false, isDeletable: false)
                        realm.add(slogan)
                    }
                    for item in K.sayingsList {
                        let saying = SloganSayingOrAcronym(type: SayingType.aSaying.description, text: item, isFavorite: false, isDeletable: false)
                        realm.add(saying)
                    }
                    for item in K.acronymList {
                        let acronym = SloganSayingOrAcronym(type: SayingType.anAcronym.description, text: item, isFavorite: false, isDeletable: false)
                        realm.add(acronym)
                    }
                }
            } catch {
                assertionFailure("Error adding slogans, sayings or acronyms \(error)")
            }
        } else {
            //not empty
            //get array of slogan strings
            //SLOGANS
            let slogans = sortedSloganStrings()
            
            //go through slogan list and add if not in DB
            for item in K.sloganList {
                if !slogans.contains(item) {
                    do {
                        try realm.write {
                            let slogan = SloganSayingOrAcronym(type: SayingType.slogan.description, text: item, isFavorite: false, isDeletable: false)
                            realm.add(slogan)
                        }
                    } catch {
                        assertionFailure("Error adding slogans, sayings or acronyms \(error)")
                    }
                }
            }
            
            //SAYINGS
            //get array of sayings strings
            let sayings = realm.objects(SloganSayingOrAcronym.self)
            
            //use map function to get String array
            let sayingArray = Array(sayings)
                .map{$0.text}
            
            //go through sayings list and add if not in DB
            for item in K.sayingsList {
                if !sayingArray.contains(item) {
                    do {
                        try realm.write {
                            let saying = SloganSayingOrAcronym(type: SayingType.aSaying.description, text: item, isFavorite: false, isDeletable: false)
                            realm.add(saying)
                        }
                    } catch {
                        assertionFailure("Error adding slogans, sayings or acronyms \(error)")
                    }
                }
            }
            
            
            //ACRONYMS
            //get array of acronym strings
            let acronyms = realm.objects(SloganSayingOrAcronym.self)
            
            //use map function to get String array
            let acronymArray = Array(acronyms)
                .map{$0.text}
            
            //go through sayings list and add if not in DB
            for item in K.acronymList {
                if !acronymArray.contains(item) {
                    do {
                        try realm.write {
                            let acronym = SloganSayingOrAcronym(type: SayingType.anAcronym.description, text: item, isFavorite: false, isDeletable: false)
                            realm.add(acronym)
                        }
                    } catch {
                        assertionFailure("Error adding slogans, sayings or acronyms \(error)")
                    }
                }
            }
        }

    }
    
    // MARK: - Helper methods
    //
    static func sortedSloganStrings() -> Array<String> {
        let realm = try! Realm()
        
        //filter slogans
        let slogans = realm.objects(SloganSayingOrAcronym.self)
        
        //use map function to get String array
        let sloganArray = Array(slogans
            .sorted(byKeyPath: "text"))
            .map{$0.text}
        
        return sloganArray
    }
    
    static func getSlogans() -> Array<SloganSayingOrAcronym> {
        let realm = try! Realm()
        
        //filter slogans
        let slogans = realm.objects(SloganSayingOrAcronym.self).filter("type == 'Slogan'")
       
        //sort alphabetically
        let sortedSlogans = Array(slogans).sorted {$0.text.localizedStandardCompare($1.text) == .orderedAscending}
        
        return sortedSlogans
    }
    
    static func getSayings() -> Array<SloganSayingOrAcronym> {
        let realm = try! Realm()
        
        //filter sayings
        let sayings = realm.objects(SloganSayingOrAcronym.self).filter("type == 'Saying'")

        //sort alphabetically
        let sortedSayings = Array(sayings).sorted {$0.text.localizedStandardCompare($1.text) == .orderedAscending}
        
        return sortedSayings
    }
    
    static func getAcronyms() -> Array<SloganSayingOrAcronym> {
        let realm = try! Realm()
        
        //filter sayings
        let acronyms = realm.objects(SloganSayingOrAcronym.self).filter("type == 'Acronym'")

        //sort alphabetically
        let sortedAcronyms = Array(acronyms).sorted {$0.text.localizedStandardCompare($1.text) == .orderedAscending}
        
        return sortedAcronyms
    }
    
    static func getFavorites() -> Array<SloganSayingOrAcronym> {
        let realm = try! Realm()
        
        //filter sayings
        let slogansSayingsOrAcronyms = realm.objects(SloganSayingOrAcronym.self).filter("isFavorite = true")

        //sort alphabetically
        let sortedSlogansSayingsOrAcronyms = Array(slogansSayingsOrAcronyms).sorted {$0.text.localizedStandardCompare($1.text) == .orderedAscending}
        
        return sortedSlogansSayingsOrAcronyms
    }
    
    //return a random number from 0 to size of list - 1
    static func getRandomSlogan()-> String {
        let sayingslist = sortedSloganStrings()
        let listSize = sayingslist.count
        let index = Int.random(in: 0...(listSize-1))
        
        return sayingslist[index]
    }
    
    //return the slogan of the day
    static func getSloganOfTheDay() -> String {
        //get total number of seconds since 1970
        let timezoneOffset =  TimeZone.current.secondsFromGMT()
        let interval = NSInteger(NSDate().timeIntervalSince1970) + timezoneOffset
                
        //get days since 1970
        let days = interval / K.secsInDay
        
        //get the sayings list
        let sayingslist = sortedSloganStrings()
        
        //get the modulus
        let index = (days % sayingslist.count)

        let slogan = "\n" + sayingslist[index] + "\n"
        
        return slogan
    }
    
    //toggle is Favorite field
    static func toggleIsFavorite (ssoa: SloganSayingOrAcronym) {
        let realm = try! Realm()
        
        try! realm.write {
            ssoa.isFavorite = !ssoa.isFavorite
        }
    }
}


