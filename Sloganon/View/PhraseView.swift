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
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Picker("Phrase Type", selection: $phraseType) {
                            Text("Slogans").tag(K.tagSlogan)
                            Text("Sayings").tag(K.tagSaying)
                            Text("Acronyms").tag(K.tagAcronym)
                            Text("Favorites").tag(K.tagFavorites)
                        }
                        .pickerStyle(.segmented)
                       // .padding()
                        
                    }
                }
                .searchable(text: $searchText)
//                .onAppear(perform: initDB)
        }
    }
    
    
//    private func initDB() {
//        //initialize db
//        // Make sure the persistent store is empty. If it's not, return the non-empty container.
//        
//        if ssas.isEmpty {
//            // This code will only run if the persistent store is empty.}
//            for slogan in initSlogans(favorites: storedFavorites()) {
//                modelContext.insert(slogan)
//            }
//            
//            for saying in initSayings(favorites: storedFavorites()) {
//                modelContext.insert(saying)
//            }
//            
//            for acronym in initAcronyms(favorites: storedFavorites()) {
//                modelContext.insert(acronym)
//            }
//        }
//    }
    
//    func storedFavorites() -> [Phrase] {
//        //read from file
//        var phrases: [Phrase] = []
//        
//        let url = URL.documentsDirectory.appending(path: K.savedDataTextFile)
//        
//        //check if file exists
//        let fileExists: Bool = FileManager.default.fileExists(atPath: url.path)
//        //printprint("fileExists: \(fileExists) at path \(url.path)")
//        
//        if fileExists {
//            do {
//                let input = try String(
//                    data: Data(contentsOf: url),
//                    encoding: .utf8
//                )
//                //print(input ?? "")
//                
//                phrases = convertCSVToSSOA(csvText: input ?? "")
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//        
//        return phrases
//    }
    
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
    PhraseView()
        .modelContainer(for: Phrase.self, inMemory: true)
}
