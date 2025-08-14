//
//  PhraseListView.swift
//  Sloganon Swift Data
//
//  Created by Sylvia Wake-Hood on 6/23/25.
//

import SwiftUI
import SwiftData


struct PhraseListView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query  var ssa: [Phrase]
    
    var  filterTag: Int = K.tagSlogan
    
    @State private var showingSheet: Bool = false
       
    var body: some View {
        List {
            ForEach(ssa) { saying in
                
                if self.filterTag != K.tagFavorites {
                    
                    NavigationLink(destination: PhraseDetailView(phrase: saying)) {
                        HStack {
                            
                            Image(systemName: saying.isFavorite ? "heart.fill" : "heart")
                            
                            
                            Text(saying.name)
                            
                        }
                    }
                } else {
                    HStack {
                        Button(action: {
                                saying.isFavorite.toggle()
                        }) {
                            Image(systemName: saying.isFavorite ? "heart.fill" : "heart")
                        }
                        
                        Text(saying.name)
                        
                    }
                }
            }
        }
    }
    
    
    
    init(filterTag: Int, searchString: String = "") {
        self.filterTag = filterTag
        
        if searchString.isEmpty {
            switch filterTag {
            case 0, 1, 2:
                _ssa = Query(filter: #Predicate<Phrase> { ssa in
                    ssa.sayingType == filterTag
                }, sort: [SortDescriptor(\Phrase.name)])
                


            case 200:
                _ssa = Query(filter: #Predicate<Phrase> { ssa in
                    ssa.isFavorite == true
                }, sort: [SortDescriptor(\Phrase.name)])
            default:
                print("Other")
            }
        } else {
            _ssa = Query(filter: #Predicate<Phrase> { ssa in
                ssa.name.localizedStandardContains(searchString)
            }, sort: [SortDescriptor(\Phrase.name)])
        }

    }
    
}

#Preview {
    PhraseListView(filterTag: 0)
}
