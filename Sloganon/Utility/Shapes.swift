//
//  Shapes.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 5/18/26.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}


enum frameSide {
    case top
    case bottom
    case left
    case right
}


struct LineShape: Shape {
    var startSide: frameSide
    var endSide: frameSide
    
    var hasArrow: Bool = true
    
    func path(in rect: CGRect) -> Path {
        var start: CGPoint!
        var end: CGPoint!
        var path = Path()
        
        switch(startSide) {
        case .top:
            start = CGPoint(x: rect.midX, y: rect.minY)
        case .bottom:
            start = CGPoint(x: rect.midX, y: rect.maxY)
        case .left:
            start = CGPoint(x: rect.minX, y: rect.midY)
        case .right:
            start = CGPoint(x: rect.maxX, y: rect.midY)
        }
        path.move(to: start)
        
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        
        switch(endSide) {
        case .top:
            end = CGPoint(x: rect.midX, y: rect.minY)
        case .bottom:
            end = CGPoint(x: rect.midX, y: rect.maxY)
        case .left:
            end = CGPoint(x: rect.minX, y: rect.midY)
        case .right:
            end = CGPoint(x: rect.maxX, y: rect.midY)
        }
        path.addLine(to: end)
        
        if hasArrow {
            addArrow(to: &path, start: CGPoint(x: rect.midX, y: rect.midY), end: end)
        }
        
        return path
    }
    
    func addArrow(to path: inout Path, start: CGPoint, end: CGPoint) {
        let headLength: CGFloat = 15
        let headAngle: CGFloat = .pi / 6 // 30 degrees
        
        // Use atan2 to find the angle of the main line
        let angle = atan2(end.y - start.y, end.x - start.x)
        
        // Calculate the two "wings" of the arrow
        let p1 = CGPoint(x: end.x - headLength * cos(angle - headAngle),
                         y: end.y - headLength * sin(angle - headAngle))
        let p2 = CGPoint(x: end.x - headLength * cos(angle + headAngle),
                         y: end.y - headLength * sin(angle + headAngle))
        
        path.move(to: end)
        path.addLine(to: p1)
        path.move(to: end)
        path.addLine(to: p2)
    }
    
    init(start: frameSide, end: frameSide, hasArrow: Bool = false) {
        self.startSide = start
        self.endSide = end
        self.hasArrow = hasArrow
    }
}

