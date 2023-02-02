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
   //     label.frame = CGRect(x: 20, y: 8, width: 320, height: 20)
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = title
        label.textAlignment = .left
        label.textColor = color.contrastingColor(isFlat: false)
        
        self.addSubview(label)
        
        label.layout(top:self.topAnchor, leading:self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 5, left: 10, bottom: 5, right: 10))
        
        self.backgroundColor = color
        
        return self
    }
    
    
    
//      Anchors a view using the input constraints.
//      - Parameter top: The top constraint.
//      - Parameter leading: The leading or left contraint.
//      - Parameter bottom: The bottom constraint.
//      - Parameter trailing: The trailing or right contraint.
//      - Parameter padding: The padding to be applied to the constraints. Requires init with UIEdgeInsets.
//      - Parameter size: The size to be added to the view. Requires init with CGSize. If all other constraints are set, sizes do not have any effect.
//

    func layout(top: NSLayoutYAxisAnchor?,
                leading: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?,
                trailing: NSLayoutXAxisAnchor?,
                padding: UIEdgeInsets = .zero,
                size: CGSize = .zero) {
         translatesAutoresizingMaskIntoConstraints = false
         if let top = top {
             topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
         }
         if let leading = leading {
             leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
         }
         if let bottom = bottom {
             bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
         }
         if let trailing = trailing {
             trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
         }
         if size.width != 0 {
             widthAnchor.constraint(equalToConstant: size.width).isActive = true
         }
         if size.height != 0 {
             heightAnchor.constraint(equalToConstant: size.height).isActive = true
         }
     }
}

