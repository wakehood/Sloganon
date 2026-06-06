//
//  AcceptItSheetView.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 6/6/26.
//

import SwiftUI

struct AcceptItSheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Accept It!!!")
                .font(.title)
            
            Button("Dismiss") {
                dismiss() // Closes the sheet
            }
            .background(Color.red)
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

#Preview {
    AcceptItSheetView()
}
