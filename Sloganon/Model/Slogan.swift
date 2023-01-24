//
//  Slogan.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 9/22/22.
//
import Foundation
import RealmSwift

class Slogan: Object{
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var slogan: String = ""
    @Persisted var isFavorite: Bool = false
    @Persisted var  isDeletable: Bool = false
    
    convenience init(slogan: String = "", isFavorite: Bool = false, isDeletable: Bool = false) {
        self.init()
        self.slogan = slogan
        self.isFavorite = isFavorite
        self.isDeletable = isDeletable
    }
    
    // MARK: - Initialization with default data
    //This function should only be called the first time the app is run
    static func initalizeSlogans(){
        let realm = try! Realm()
        
        //ensure that realm slogan is empty
        assert(realm.objects(Slogan.self).isEmpty, "trying to initialize when realm Slogan is not empty")
        
        do {
            try realm.write {
                for item in K.sloganList {
                    let slogan = Slogan(slogan: item, isFavorite: false, isDeletable: false)
                    realm.add(slogan)
                }
            }
        } catch {
            assertionFailure("Error adding slogans \(error)")
        }
    }
    
    // MARK: - Healper methods
    //
    static func sortedSloganStrings() -> Array<String> {
        let realm = try! Realm()
        
        //use map function to get String array
        let sloganArray = Array(realm.objects(Slogan.self)
            .sorted(byKeyPath: "slogan"))
            .map{$0.slogan}
        
        return sloganArray
    }
    
    static func getSlogans() -> Array<Slogan> {
        let realm = try! Realm()

        //sort alphabetically
        let sortedSlogans = Array(realm.objects(Slogan.self)).sorted {$0.slogan.localizedStandardCompare($1.slogan) == .orderedAscending}
        //sort by isFavorite and return
        return (sortedSlogans.sorted { $0.isFavorite && !$1.isFavorite })
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

        let slogan = sayingslist[index]
        
        return slogan
    }
    
    //toggle is Favorite field
    static func toggleIsFavorite (slogan: Slogan) {
        let realm = try! Realm()
        
        try! realm.write {
            slogan.isFavorite = !slogan.isFavorite
        }
    }
}


