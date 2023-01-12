//
//  UIColorExtension.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/10/23.
//

import Foundation
import UIKit

extension UIColor {
    //
    func darken(byPercentage: CGFloat) -> UIColor {
        
        var h: CGFloat = 0.0
        var s: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0

        guard getHue(&h, saturation: &s, brightness: &b, alpha: &a)
            else {return self}
        
        if byPercentage > 0 {
            b = min(b - byPercentage, 1.0)
        }

        return UIColor(hue: h,
                       saturation: s,
                       brightness: b,
                       alpha: a)
    }
    
    func contrastingColor(isFlat: Bool) -> UIColor {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0

        guard getRed(&r, green: &g, blue: &b, alpha: &a)
            else {return self}
        
        //calculate luminance
        //Check if color is transparent
        if (a == 0) {
            return UIColor.clear
        }
        //from wikipedia http://en.wikipedia.org/wiki/Luminance_(relative)
        r *= 0.2126
        g *= 0.7152
        b *= 0.0722
        
        let relativeLuminance = r + g + b
        
        if isFlat {
            return (relativeLuminance > 0.6) ?
            UIColor(hue: 0.0, saturation: 0.0, brightness: 15, alpha: a) :
            UIColor(hue: 192.0, saturation: 2.0, brightness: 95, alpha: a)

        } else {
            return (relativeLuminance > 0.6) ?
            UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: a) :
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: a)
        }
    }
    
    // Calculates the percentage to darken a color by and then lighten by
    // This gives a gradient effect.
    // Row is the row in the table view
    // repeatEvery is how many rows for the gradient to conclude
    // It defaults to 10
    
    static func getPercentBy(row: Int, repeatEvery: Int = 10) -> CGFloat
    {
        
        //Do Integer division to figure out which "repeat group" of 10 rows this is
        //And the figure out if its an even or odd group
        let repeatGroup = row / repeatEvery
        let isEvenRepeatGroup = repeatGroup % 2 == 0
        
        //Within a repeat group get the modulus to figure out what the percent darkening is
        //Note do floating point math, i.e. cast to CGFloats
        let percent =  CGFloat(row % repeatEvery) / CGFloat(repeatEvery)
        
        //If it is even the rows will get slowly darker. If odd they will get slowly lighter
        //skew lighter by 50%, because
        
        return   ((isEvenRepeatGroup) ? percent : (1 - percent)) * 0.50
    }
    
    //Function to check if asset named color is valid
    //returns white if not
    static func checkColor(named: String) -> UIColor{
        if let color = UIColor(named:named) {
            return color
        } else {
            print("No Color found")
            return UIColor.white
        }
    }
}
