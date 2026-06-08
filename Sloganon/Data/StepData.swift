//
//  StepData.swift
//  Sloganon Swift Data
//
//  Created by Sylvia Wake-Hood on 6/27/25.
//

import Foundation


func initStep(stepText: String, stepNumber: Int) -> Step {
    Step(stepText: stepText, stepNumber: stepNumber, alternateStepText: stepText)
}

struct StepInfo {
    var number: Int
    var step: String
}

func initSteps() -> [Step] {
    var steps = [StepInfo]()
    
    steps.append(StepInfo(number: 1, step: "We admitted we were powerless over alcohol - that our lives had become unmanageable."))
    steps.append(StepInfo(number: 2, step: "Came to believe that a Power greater than ourselves could restore us to sanity."))
    steps.append(StepInfo(number: 3, step: "Made a decision to turn our will and our lives over to the care of God as we *understood* Him."))
    steps.append(StepInfo(number: 4, step: "Made a searching and fearless moral inventory of ourselves."))
    steps.append(StepInfo(number: 5, step: "Admitted to God, to ourselves, and to another human being the exact nature of our wrongs."))
    steps.append(StepInfo(number: 6, step: "Were entirely ready to have God remove all these defects of character."))
    steps.append(StepInfo(number: 7, step: "Humbly asked Him to remove our shortcomings."))
    steps.append(StepInfo(number: 8, step: "Made a list of all persons we had harmed, and became willing to make amends to them all."))
    steps.append(StepInfo(number: 9, step: "Made direct amends to such people wherever possible, except when to do so would injure them or others."))
    steps.append(StepInfo(number: 10, step: "Continued to take personal inventory and when we were wrong promptly admitted it."))
    steps.append(StepInfo(number: 11, step: "Sought through prayer and meditation to improve our conscious contact with God as we understood Him, praying only for knowledge of His will for us and the power to carry that out."))
    steps.append(StepInfo(number: 12, step: "Having had a spiritual awakening as the result of these steps, we tried to carry this message to others, and to practice these principles in all our affairs."))
    
    
    var dbSteps: [Step] = []
    for step in steps {
        dbSteps.append(initStep(stepText: step.step, stepNumber: step.number))
    }
    
    return dbSteps
}
