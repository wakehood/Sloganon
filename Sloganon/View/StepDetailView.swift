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
     
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.aquaBlue), Color(.mediumBlue)]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Text("Step \(step.stepNumber)")
                    .font(Font.largeTitle.bold())
                
                
                VStack {
                    Text("Standard")
                        .font(Font.title.bold())
                    HStack {
                        Spacer()
                        Text(step.stepText)
                            .font(.title)
                        Spacer()
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 50)
                    
                    Text("Custom")
                        .font(Font.title.bold())
                    Toggle("Show Custom Step Wording", isOn: $step.showAlternate)
                        .padding()
                        .tint(.purple) // Changes the default green active track color

                    HStack {
                        Spacer()
                        TextField("Alternate Text", text: $step.alternateStepText, axis: .vertical)
                            .textContentType(.name)
                            .font(.title)
                            .background(Color(Color(.sloganonLightYellow)))
                            .cornerRadius(8)
                            .lineLimit(5)
                        
                        
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                }
                .padding(.top, 20)
                
                Spacer()
            }
        }
    }
}

#Preview {
    let step1 = Step(stepText: "We admitted we were powerless over alcohol — that our lives had become unmanageable.", stepNumber: 1, alternateStepText: "We admitted we were powerless over alcohol — that our lives had become unmanageable.", showAlternate: false, notes: [])
    
    StepDetailView(step: step1)
}
