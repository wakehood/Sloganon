//
//  SloganonApp.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 8/14/25.
//
import SwiftUI
import SwiftData

@main
struct Sloganon_Swift_DataApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Phrase.self,
            Step.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        print("The URL is:")
        print (modelConfiguration.url)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
            
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
       

        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}

