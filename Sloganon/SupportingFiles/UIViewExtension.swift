//
//  UIViewExtension.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 1/8/23.
//

import Foundation
import UIKit

extension UIView {
    func headerViewWithLabel(title: String, color: UIColor = UIColor.clear) -> UIView {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 8, width: 320, height: 20)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = title
        label.textAlignment = .center
        
        self.addSubview(label)
        self.backgroundColor = color
        
        return self
    }
}
