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
    @objc dynamic var url: String = ""
    
    convenience init(dn: String, u: String) {
        self.init()
        
        self.displayName = dn
        self.url = u
    }
    
    static func webPageList() -> Array<WebPage> {
        let realm = try! Realm()

        return Array(realm.objects(WebPage.self))
    }
    
    static func initializeWebPages() {
        let realm = try! Realm()
        do {
            try realm.write {
                for wpInfo in K.webPageList {
                    let webPage = WebPage(dn: wpInfo[0],  u: wpInfo[1])
                    realm.add(webPage)
                }
            }
        } catch {
            print("Error adding webPages \(error)")
        }
    }

}

