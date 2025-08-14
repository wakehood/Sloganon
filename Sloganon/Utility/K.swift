//
//  K.swift
//  Sloganon Swift Data
//
//  Created by Sylvia Wake-Hood on 6/27/25.
//

import Foundation


struct K {
    
    // in lieu of an enum because SwiftData would require a fancy enum and since there are only
    // three (3) elements this seems more straight forward
    static let sayingTypeSlogan  = 0
    static let sayingTypeSaying  = 1
    static let sayingTypeAcronym = 2
    
    //same as above - in lieu of an enum for how to display the step(s)
    static let showOriginal  = 0
    static let showAlternate = 1
    static let showBoth      = 2
    
    //we just want tags to be different integers
    static let tagSlogan    = sayingTypeSlogan
    static let tagSaying    = sayingTypeSaying
    static let tagAcronym   = sayingTypeAcronym
    static let tagSearch    = 100
    static let tagFavorites = 200
    
    static let savedDataTextFile = "savedData.txt"
}
