//
//  ContentView.swift
//  Sloganon Swift Data
//
//  Created by Sylvia Wake-Hood on 6/19/25.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.blue
    }
    
    @Environment(\.modelContext) private var modelContext
    @Query var phrases: [Phrase]
    @Query(sort: [SortDescriptor(\Step.stepNumber)]) private var steps: [Step]
    
    
    var body: some View {
        TabView {
            DailyView()
                .tabItem {  Label("Daily", systemImage: "calendar.badge") }
            
            PhraseView()
                .tabItem {  Label("Phrases", systemImage: "textformat.abc") }
            
            StepView()
                .tabItem {  Label("Steps", systemImage: "stairs") }
            
            SerenityPrayerView()
                .tabItem {  Label("SerenityPrayer", systemImage: "bird") }
            //
            //            WebPageInfoView()
            //                .tabItem {  Label("Info", systemImage: "network") }
            //
            //            SettingsView()
            //                .tabItem {  Label("Settings", systemImage: "gear") }
        }
        .accentColor(.black)
        .onAppear(perform: initDB)
    }
    
    
    private func initDB() {
        //initialize db
        // Make sure the persistent store is empty. If it's not, return the non-empty container.
        
        if phrases.isEmpty {
            // This code will only run if the persistent store is empty.}
            for slogan in initSlogans(favorites: storedFavorites()) {
                modelContext.insert(slogan)
            }
            
            for saying in initSayings(favorites: storedFavorites()) {
                modelContext.insert(saying)
            }
            
            for acronym in initAcronyms(favorites: storedFavorites()) {
                modelContext.insert(acronym)
            }
        }
        
        if steps.isEmpty {
            // This code will only run if the persistent store is empty.
            let steps = initSteps()
            
            for step in steps {
                modelContext.insert(step)
            }
        }
    }
        
    func storedFavorites() -> [Phrase] {
        //read from file
        var phrases: [Phrase] = []
        
        let url = URL.documentsDirectory.appending(path: K.savedDataTextFile)
        
        //check if file exists
        let fileExists: Bool = FileManager.default.fileExists(atPath: url.path)
        //printprint("fileExists: \(fileExists) at path \(url.path)")
        
        if fileExists {
            do {
                let input = try String(
                    data: Data(contentsOf: url),
                    encoding: .utf8
                )
                //print(input ?? "")
                
                phrases = convertCSVToSSOA(csvText: input ?? "")
            } catch {
                print(error.localizedDescription)
            }
        }
        
        return phrases
    }
    
    func convertCSVToSSOA(csvText: String) -> [Phrase] {
        var slogans: [Phrase] = []
        let rows = csvText.split(separator: "\n")
        
        //let headers = rows.first!
        for row in rows.dropFirst() {
            let columns = row.split(separator: ",")
            
            let phrase = Phrase(
                name: columns[0].trimmingCharacters(in: .whitespacesAndNewlines),
                sayingType: Int(columns[1].trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0,
                isFavorite: Bool(columns[2].trimmingCharacters(in: .whitespacesAndNewlines))!)
            
            slogans.append(phrase)
            
        }
        return slogans
    }
}


#Preview {
    ContentView()
}
