//
//  PhraseView.swift
//  Sloganon Swift Data
//
//  Created by Sylvia Wake-Hood on 6/27/25.
//

import SwiftUI
import SwiftData


struct PhraseView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var ssas: [Phrase]
   
    @State private var phraseType = K.sayingTypeSlogan
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            
            PhraseListView(filterTag: phraseType, searchString: searchText)
                .navigationTitle("Phrases")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Picker("Phrase Type", selection: $phraseType) {
                            Text("Slogans").tag(K.tagSlogan)
                            Text("Sayings").tag(K.tagSaying)
                            Text("Acronyms").tag(K.tagAcronym)
                            Text("Favorites").tag(K.tagFavorites)
                        }
                        .pickerStyle(.segmented)
                        .padding()
                        
                    }
                }
                .searchable(text: $searchText)
                .onAppear(perform: initDB)
        }
    }
    
    
    private func initDB() {
        //initialize db
        // Make sure the persistent store is empty. If it's not, return the non-empty container.

        if ssas.isEmpty {
            // This code will only run if the persistent store is empty.
            let slogans = initSlogans()
            
            for slogan in slogans {
                modelContext.insert(slogan)
            }
            
            let sayings = initSayings()
            
            for saying in sayings {
                modelContext.insert(saying)
            }
            
            for acronym in initAcronyms() {
                modelContext.insert(acronym)
            }
        } 
    }
}

#Preview {
    PhraseView()
        .modelContainer(for: Phrase.self, inMemory: true)
    
}
