//
//  ContentView.swift
//  Sloganon Swift Data
//
//  Created by Sylvia Wake-Hood on 6/19/25.
//

import SwiftUI
struct ContentView: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.blue
    }
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
    }
}

#Preview {
    ContentView()
}
