//
//  Step.swift
//  Sloganon Swift Data
//
//  Created by Sylvia Wake-Hood on 6/25/25.
//

import Foundation

import SwiftData

@Model
final class Step {
    var stepText: String
    var stepNumber: Int = 1
    var alternateStepText: String
    var howToShow: Int = 0
    var notes: [Note] // Array of strings property

    init(
        stepText: String,
        stepNumber: Int = 1,
        alternateStepText: String = "",
        howToShow: Int = 0,
        notes: [Note] = []) {
            
        self.stepText = stepText
        self.stepNumber = stepNumber
        self.alternateStepText = alternateStepText
        self.howToShow = howToShow
        self.notes = notes
    }
}
