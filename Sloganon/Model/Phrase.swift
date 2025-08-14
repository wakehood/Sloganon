//
//  Phrase.swift
//  Sloganon Swift Data
//
//  Created by Sylvia Wake-Hood on 6/19/25.
//

import Foundation
import SwiftData

@Model

final class Phrase {

    var name: String = ""
    var sayingType: Int = 0
    var isFavorite: Bool = false
    var canDelete: Bool = false
    var isHidden: Bool = false
    var notes: [Note]
    
    init(name: String = "",
         sayingType: Int = 0,
         isFavorite: Bool = false,
         isDeletable: Bool = false,
         isHidden: Bool = false,
         notes: [Note] = []) {
        self.name = name
        self.sayingType = sayingType
        self.isFavorite = isFavorite
        self.canDelete = isDeletable
        self.isHidden = isHidden
        self.notes = []
    }
}

