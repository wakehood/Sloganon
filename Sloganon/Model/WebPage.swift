//
//  WebPage.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/16/23.
//

import Foundation
import RealmSwift

class WebPage: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var displayName: String = ""
    @Persisted var url: String = ""
    
    convenience init(dn: String,  u: String) {
        self.init()
        
        self.displayName = dn
        self.url = u
    }
    
    static func webPageList() -> Array<WebPage> {
        let realm = try! Realm()

        //sort alphabetically
        let sortedWebPages = Array(realm.objects(WebPage.self)).sorted {$0.displayName.localizedStandardCompare($1.displayName) == .orderedAscending}
        
        return sortedWebPages
    }
    
    static func initializeWebPages() {
        let realm = try! Realm()
        
        //make sure really is empty (belt and suspenders)
        assert(realm.objects(WebPage.self).isEmpty, "realm WebPage is not empty in initialization")
        
        do {
            try realm.write {
                for wpInfo in K.webPages {
                    //use an assert to check for valid formatting; NB asserts are not compiled into production code
                    assert(wpInfo.count == K.elementsPerWebPageInfo, "Unexpected K.webPage formating, at least one webpage in the list does not have three elements")
 
                    let webPage = WebPage(dn: wpInfo[0], u: wpInfo[1])
                    realm.add(webPage)
                }
            }
        } catch {
            assertionFailure("Error adding webPages \(error)")
        }
    }
    
    static func addWebPage(displayName: String, url: String) {
        let realm = try! Realm()
        
        do {
            try realm.write {
                let webPage = WebPage(dn: displayName, u: url)
                realm.add(webPage)
            }
        } catch {
            print("Error saving web page, \(error)")
        }
    }
    
    static func deleteWebPage (id: ObjectId) {
        let realm = try! Realm()
        
        guard let webPageToBeDeleted = realm.object(ofType: WebPage.self, forPrimaryKey: id) else { return}
        
        do {
            try realm.write {
                realm.delete(webPageToBeDeleted)
            }
        } catch {
            print("Error deleting web page, \(error)")
        }
    }
    
    static func alreadyExists (title: String, url: String) ->Bool {
        let realm = try! Realm()
    
        
        let predicate = "displayName = '" + title + "' AND url = '" + url + "'"
        let results =  realm.objects(WebPage.self).filter(predicate)

        return results.count == 0 ? false : true
    }

}

