//
//  SloganonApp.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 8/14/25.
//
import SwiftUI
import SwiftData

@main
struct SloganonApp: App {
    
    var body: some Scene {
        
        WindowGroup {
            LaunchScreenView()
        }
        .modelContainer(for: [Phrase.self, Step.self])
    }
}

