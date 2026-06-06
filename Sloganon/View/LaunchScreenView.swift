//
//  LaunchScreenView.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 6/6/26.
//

import SwiftUI

struct LaunchScreenView: View {
    
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ContentView()
        }
        else {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(.aquaBlue), Color(.mediumBlue)]), startPoint: .topTrailing, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        //.padding
                    
                    Text("Loading...")
                        .font(.largeTitle)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        self.isActive.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}
