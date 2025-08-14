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
            //get stored favorites
            let importedFavorites: [Phrase] = storedFavorites()
            
            // This code will only run if the persistent store is empty.}
            let slogans = initSlogans(favorites: importedFavorites)
            
            for slogan in slogans {
                modelContext.insert(slogan)
            }
            
            let sayings = initSayings(favorites: importedFavorites)
            
            for saying in sayings {
                modelContext.insert(saying)
            }
            
            for acronym in initAcronyms(favorites: importedFavorites) {
                modelContext.insert(acronym)
            }
            
            
//            //update with stored favorites
//            //read from file
//            var phrases: [Phrase] = []
//            
//            let url = URL.documentsDirectory.appending(path: K.savedDataTextFile)
//            
//            //check if file exists
//            let fileExists: Bool = FileManager.default.fileExists(atPath: url.path)
//            print("fileExists: \(fileExists) at path \(url.path)")
//            
//            if fileExists {
//                do {
//                    let input = try String(
//                        data: Data(contentsOf: url),
//                        encoding: .utf8
//                    )
//                    print(input ?? "")
//                    
//                    phrases = convertCSVToSSOA(csvText: input ?? "")
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
            
            //update database with stored Favorites
         //   updateFavorites(importedPhrases: phrases)
            
        }
    }
    
    func storedFavorites() -> [Phrase] {
        //read from file
        var phrases: [Phrase] = []
        
        let url = URL.documentsDirectory.appending(path: K.savedDataTextFile)
        
        //check if file exists
        let fileExists: Bool = FileManager.default.fileExists(atPath: url.path)
        print("fileExists: \(fileExists) at path \(url.path)")
        
        if fileExists {
            do {
                let input = try String(
                    data: Data(contentsOf: url),
                    encoding: .utf8
                )
                print(input ?? "")
                
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
        print(rows)
        for row in rows.dropFirst() {
            let columns = row.split(separator: ",")
            
            print(columns)
            
            let phrase = Phrase(
                name: columns[0].trimmingCharacters(in: .whitespacesAndNewlines),
                sayingType: Int(columns[1].trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0,
                isFavorite: Bool(columns[2].trimmingCharacters(in: .whitespacesAndNewlines))!)
            
            slogans.append(phrase)
            
        }
        return slogans
    }
    
//    func updateFavorites(importedPhrases: [Phrase]) {
//        //check through imported
//        for phrase in importedPhrases {
//            for ssa in ssas {
//                let name = phrase.name.removingAllWhitespaces().replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "\t", with: "")
//                let ssaname = ssa.name.removingAllWhitespaces().replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "\t", with: "")
//                
//                if name == ssaname {
//                    ssa.isFavorite = phrase.isFavorite
//                }
//            }
//        }
//        
//    }
}


//var name: String = ""
//var sayingType: Int = 0
//var isFavorite: Bool = false
//var canDelete: Bool = false
//var isHidden: Bool = false
//var notes: [Note]

#Preview {
    PhraseView()
        .modelContainer(for: Phrase.self, inMemory: true)
    
}
