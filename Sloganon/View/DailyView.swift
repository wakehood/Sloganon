//
//  DailyView.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 6/6/26.
//

import SwiftUI

struct DailyView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.aquaBlue), Color(.mediumBlue)]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Let Go and Let God")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .frame(height: 300)
                    .padding()
                
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    //.padding
                
                Text("We admitted we were powerless over alcohol - that our lives had become unmanageable.")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .frame(height: 300)
                    .padding()
            }
        }
    }
}

#Preview {
    DailyView()
}
