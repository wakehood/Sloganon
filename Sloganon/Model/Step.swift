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
    var showAlternate: Bool = false
    var notes: [Note] // Array of strings property

    init(
        stepText: String,
        stepNumber: Int = 1,
        alternateStepText: String,
        showAlternate: Bool = false,
        notes: [Note] = []) {
            
        self.stepText = stepText
        self.stepNumber = stepNumber
        self.alternateStepText = stepText
        self.showAlternate = showAlternate
        self.notes = notes
    }
    
//    private func initDB(steps: [Step]) {
//        //initialize db
//        // Make sure the persistent store is empty. If it's not, return the non-empty container.
//        
//        if steps.isEmpty {
//            // This code will only run if the persistent store is empty.
//            let steps = initSteps()
//            
//            for step in steps {
//                modelContext!.insert(step)
//            }
//        }
//    }
}
