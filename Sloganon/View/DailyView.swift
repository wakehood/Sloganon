//
//  DailyView.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 6/6/26.
//

import SwiftUI
import SwiftData

struct DailyView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var phrases: [Phrase]
    @Query(sort: [SortDescriptor(\Step.stepNumber)]) private var steps: [Step]
    
    let isTesting: Bool = true
    @State  var currentPhraseString: String = ""
    @State  var currentIndex: Int = 0

    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.aquaBlue), Color(.mediumBlue)]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Button(action: {
                    let nextIndex = (currentIndex + 1) % phrases.count
                    currentPhraseString = getDailyPhrase(index: nextIndex)
                    currentIndex = nextIndex
                }) {
                    Text(currentPhraseString)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.5)
                        .frame(height: 300)
                        .padding()
                }
                
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    //.padding
                
                Text("We admitted we were powerless over alcohol - that our lives had become unmanageable.")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .frame(height: 300)
                    .padding()
            }
            .onAppear {
                let count = phrases.count
                let daysSince1970 = getDaysSince1970()
                currentIndex = (daysSince1970 % count)
                currentPhraseString = getDailyPhrase()
            }
        }
    }
    
    func getDailyPhrase() -> String {
        let index = (getDaysSince1970() % phrases.count)
        let dailyPhrase = phrases[index]
        return dailyPhrase.name
    }
    
    
    //used for testing
    func getDailyPhrase(index: Int) -> String {
        phrases[index].name
    }
    
    func getDaysSince1970(for date: Date = Date(), timeZone: TimeZone = .current) -> Int {
        var calendar = Calendar.current
        calendar.timeZone = timeZone // Set your specific timezone
        
        let epochDate = Date(timeIntervalSince1970: 0)
        
        // Get the start of the day in the specified timezone
        let startOfEpoch = calendar.startOfDay(for: epochDate)
        let startOfTarget = calendar.startOfDay(for: date)
        
        // Calculate full days between the two dates
        let components = calendar.dateComponents([.day], from: startOfEpoch, to: startOfTarget)
        
        return components.day ?? 0
    }
}

#Preview {
    DailyView()
}
