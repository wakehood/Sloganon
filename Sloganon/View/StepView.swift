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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(steps) { step in

                     NavigationLink(destination: StepDetailView(step: step)) {
                         HStack {
                             Text("\(step.stepNumber)")
 
                             Spacer()
 
                             Text(step.stepText)
                         }
                     } 
                }
            }
            .navigationTitle(Text("Steps"))
           
        }
        .onAppear (perform: initDB)
    }
    
    private func initDB() {
        //initialize db
        // Make sure the persistent store is empty. If it's not, return the non-empty container.
        
        if steps.isEmpty {
            // This code will only run if the persistent store is empty.
            let steps = initSteps()
            
            for step in steps {
                modelContext.insert(step)
            }
        } 
    }
 
}

#Preview {
    StepView()
}
