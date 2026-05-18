//
//  LineView.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 5/18/26.
//

import SwiftUI

struct LineView: View {
    var startSide: frameSide
    var endSide: frameSide
    var hasArrow: Bool
    
    var body: some View {
        LineShape(start: startSide, end: endSide, hasArrow: hasArrow)
            .stroke(Color.gray, lineWidth: 2)
    }
    
    init(start: frameSide, end: frameSide, hasArrow: Bool = false) {
        self.startSide = start
        self.endSide = end
        self.hasArrow = hasArrow
    }
}

#Preview {
    LineView(start: .left, end: .right)
}
