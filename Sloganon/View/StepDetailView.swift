//
//  StepDetailView.swift
//  Sloganon Swift Data
//
//  Created by Sylvia Wake-Hood on 6/27/25.
//

import SwiftUI
import SwiftData

struct StepDetailView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Bindable var step: Step
   // @State private var alternateText: String = ""
    
    var body: some View {
        Text("Step Detail View")
        
        Text("Step \(step.stepNumber)")
        
        Spacer()
        
        VStack {
            HStack {
                Spacer()
                Text(step.stepText)
                Spacer()

            }.padding(.horizontal)
            
        }
        Spacer()
        
        
        TextField("Alternate Text", text: $step.alternateStepText)
            .textContentType(.name).padding(.horizontal)
        
        Spacer()   }
}

#Preview {
    let step1 = Step(stepText: "We admitted we were powerless over alcohol — that our lives had become unmanageable.", stepNumber: 1, alternateStepText: "", howToShow: 0, notes: [])
    
    StepDetailView(step: step1)
}
