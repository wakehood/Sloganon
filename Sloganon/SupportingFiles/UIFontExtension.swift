//
//  UIFontExtension.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 7/29/23.
//

import Foundation
import UIKit

extension UIFont {
    static let headerFont     = checkFont(named: "Rockwell-Regular", size: 24)
    
    //Function to check if asset "named" font is valid
    //returns system font if not
    static func checkFont(named: String, size: CGFloat) -> UIFont {
        if let font = UIFont(name: named, size: size) {
            return font
        } else {
            print("No Font found")
            return UIFont.systemFont(ofSize: size)
        }
    }
    
}
