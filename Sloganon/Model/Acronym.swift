//
//  Acronym.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/15/23.
//

//import Foundation
//import RealmSwift
//
//class Acronym: Object{
//    @objc dynamic var acronym: String = ""
//    @objc dynamic var isFavorite: Bool = false
//    @objc dynamic var  isDeletable: Bool = false
//    
//    convenience init(acronym: String = "", isFavorite: Bool = false, isDeletable: Bool = false) {
//        self.init()
//        self.acronym = acronym
//        self.isFavorite = isFavorite
//        self.isDeletable = isDeletable
//    }
//    
//    // MARK: - Initialization with default data
//    //This function should only be called the first time the app is run
//    static func initalizeAcronyms(){
//        let realm = try! Realm()
//        
//        //don't add acronyms twice - this is belt and suspenders
//        assert(realm.objects(Acronym.self).isEmpty, "realm Acronym is not empty")
//
//        do {
//            try realm.write {
//                for item in K.acronymList {
//                    let acronym = Acronym(acronym: item,isFavorite: false, isDeletable: false)
//                    realm.add(acronym)
//                }
//            }
//        } catch {
//            assertionFailure("Error adding acronyms \(error)")
//        }
//    }
//    
//    // MARK: - Helper functions
//    //get a sorted list of the the acronyms
//    static func getAcronyms() -> Array<Acronym> {
//        let realm = try! Realm()
//        
//        return Array(realm.objects(Acronym.self))
//            .sorted{$0.acronym.localizedStandardCompare($1.acronym) == .orderedAscending}
//    }
//}
