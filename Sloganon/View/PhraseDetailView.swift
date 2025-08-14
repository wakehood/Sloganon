//
//  PhraseDetaiIView.swift
//  Sloganon Swift Data
//
//  Created by Sylvia Wake-Hood on 6/30/25.
//

import SwiftUI

struct PhraseDetailView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Bindable var phrase: Phrase
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
    
        
        VStack {
            Button(
                action: {
                    self.phrase.isFavorite.toggle()
                }, label: {
                    Image(systemName: self.phrase.isFavorite ? "heart.fill" : "heart")
                })
            .frame(width: 25, height: 25)
            
            Text("\(phrase.name)")

            
        }
        
        
        Spacer()
    }
    
    
}

#Preview {
    let phrase: Phrase = initSlogan(slogan: "let Go and Let God")
    PhraseDetailView(phrase: phrase)
}
