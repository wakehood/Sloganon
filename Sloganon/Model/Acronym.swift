//
//  Acronym.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/15/23.
//

import Foundation
import RealmSwift

class Acronym: Object{
    @objc dynamic var acronym: String = ""
    @objc dynamic var isFavorite: Bool = false
    @objc dynamic var  isDeletable: Bool = false
    
    convenience init(acronym: String = "", isFavorite: Bool = false, isDeletable: Bool = false) {
        self.init()
        self.acronym = acronym
        self.isFavorite = isFavorite
        self.isDeletable = isDeletable
    }
}
