//
//  WebPage.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/16/23.
//

import Foundation
import RealmSwift

class WebPage: Object {
    @objc dynamic var displayName: String = ""
    @objc dynamic var state: String = ""
    @objc dynamic var url: String = ""
    
    convenience init(dn: String, s: String, u: String) {
        self.init()
        
        self.displayName = dn
        self.state = s
        self.url = u
    }
    
    static func webPageList() -> Array<WebPage> {
        let realm = try! Realm()

        //sort alphabetically
        let sortedWebPages = Array(realm.objects(WebPage.self)).sorted {$0.state.localizedStandardCompare($1.state) == .orderedAscending}
        
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
 
                    let webPage = WebPage(dn: wpInfo[0], s: wpInfo[1], u: wpInfo[2])
                    realm.add(webPage)
                }
            }
        } catch {
            assertionFailure("Error adding webPages \(error)")
        }
    }

}

