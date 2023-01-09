//
//  StringExtensions.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 9/22/22.
//

import Foundation

extension String {

   func removingAllWhitespaces() -> String {
       return removingCharacters(from: .whitespaces)
   }

   func removingCharacters(from set: CharacterSet) -> String {
       var newString = self
       newString.removeAll { char -> Bool in
           guard let scalar = char.unicodeScalars.first else { return false }
           return set.contains(scalar)
       }
       return newString
   }
}
