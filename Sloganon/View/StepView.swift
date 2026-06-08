//
//  StepView.swift
//  Sloganon Swift Data
//
//  Created by Sylvia Wake-Hood on 6/27/25.
//

import SwiftUI
import SwiftData

struct StepView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: [SortDescriptor(\Step.stepNumber)]) private var steps: [Step]
    
    var percentage: Double = 1.0
 //   @State private var counter = 1.0
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(steps) { step in
                   
                    NavigationLink(destination: StepDetailView(step: step)) {
                        HStack {
                            Text("\(step.stepNumber)")
                            
                            Spacer()
                            
                            if step.showAlternate {
                                Text(step.alternateStepText)
                            } else {
                                Text(step.stepText)
                            }
                        }
                        
                    }
                    .listRowBackground(Color(.mediumBlue).opacity(GetPercentage(stepNumber: step.stepNumber)))
                    
                }
            }
            
            .navigationTitle(Text("Steps"))
            
        }
    }
    
    private func GetPercentage(stepNumber: Int) -> Double {
        guard stepNumber > 0 && stepNumber <= 12 else { return 0.0 }
        
        //lookup table
        let percentCalc = [1.0, 0.95, 0.90, 0.85, 0.80, 0.75, 0.70, 0.75, 8.0, 8.5, 9.0, 9.5]
        
        guard percentCalc.count <= 12 else { return 0.0 }
        
        let percentage: Double = percentCalc[stepNumber - 1]
        print("step \(stepNumber) % \(percentage)")
        return percentage
        
    }
}

#Preview {
    StepView()
}
