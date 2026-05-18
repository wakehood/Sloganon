//
//  SerenityPrayerView.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 5/18/26.
//

import SwiftUI


struct SerenityPrayerView: View {
    
    let stdHeight: CGFloat = 75
    let leftMostVStackWidth: CGFloat = 40
    let ShapeVStackWidth: CGFloat = 150
    let rightArrowVStackWidth: CGFloat = 60
    let rightShapeWidth: CGFloat = 100
    
    var body: some View {
        
        Text("God Grant me the Serenity to accept the things I cannot change, the courage to change the things I can, and the wisdom to know the difference.")
            .frame(width: 380, height: 100)
        
        //        LineView(start: .left, end: .right)
        //            .frame(width: 100, height: 100)
        
        //        LineView(start: .bottom, end: .right)
        //            .frame(width: 100, height: 100)
        //
        //        LineView(start: .top, end: .bottom)
        //            .frame(width: 100, height: 100)
        //
        //        LineView(start: .left, end: .top)
        //            .frame(width: 100, height: 100)
        //
        //        LineView(start: .left, end: .bottom)
        //            .frame(width: 100, height: 100)
        //
        //        LineView(start: .right, end: .top)
        //            .frame(width: 100, height: 100)
        //
        //        LineView(start: .right, end: .bottom)
        //            .frame(width: 100, height: 100)
        
        HStack(spacing:0){
            
            VStack(spacing: 0) {
                
                Spacer()
                
                LineView(start: .bottom, end: .right, hasArrow: true)
                    .frame(width: leftMostVStackWidth, height: stdHeight)
                
                LineView(start: .top, end: .bottom, hasArrow: false)
                    .frame(width: leftMostVStackWidth, height: stdHeight)
                
                LineView(start: .top, end: .bottom, hasArrow: false)
                    .frame(width: leftMostVStackWidth, height: stdHeight)
                
                LineView(start: .top, end: .bottom, hasArrow: false)
                    .frame(width: leftMostVStackWidth, height: stdHeight)
                
                LineView(start: .top, end: .bottom, hasArrow: false)
                    .frame(width: leftMostVStackWidth, height: stdHeight)
                
                LineView(start: .top, end: .bottom, hasArrow: false)
                    .frame(width: leftMostVStackWidth, height: stdHeight)
                
                LineView(start: .right, end: .top, hasArrow: false)
                    .frame(width: leftMostVStackWidth, height: stdHeight)
                
                Spacer()
                
                
            }
            
            VStack(spacing: 0) {
                
                Spacer()
                
                Capsule()
                    .fill(Color.blue)
                    .frame(width: ShapeVStackWidth, height: stdHeight)
                    .overlay(
                        Text("Thing")
                            .font(Font.system(size: 20, weight: .regular, design: .default))
                    )
                    .padding( 0)
                
                LineView(start: .top, end: .bottom, hasArrow: true)
                    .frame(width: ShapeVStackWidth, height: stdHeight)
                
                Diamond()
                    .fill(Color.green)
                    .frame(width: ShapeVStackWidth, height: stdHeight)
                    .overlay(
                        Text("Can\nI Change \nIt?")
                            .font(Font.system(size: 18, weight: .regular, design: .default))
                            .multilineTextAlignment(.center)
                    )
                
                ZStack {
                    LineView(start: .top, end: .bottom, hasArrow: true)
                        .frame(width: ShapeVStackWidth, height: stdHeight)
                    Text("Yes")
                        .background(Color.white)
                }
                
                
                Rectangle()
                    .fill(Color.purple)
                    .frame(width: ShapeVStackWidth, height: stdHeight)
                    .overlay(
                        Text("Change It")
                            .font(Font.system(size: 20, weight: .regular, design: .default))
                            .multilineTextAlignment(.center)
                    )
                
                LineView(start: .top, end: .bottom, hasArrow: true)
                    .frame(width: ShapeVStackWidth, height: stdHeight)
                
                Capsule()
                    .fill(Color.teal)
                    .frame(width: ShapeVStackWidth, height: stdHeight)
                    .overlay(
                        Text("Thing")
                            .font(Font.system(size: 20, weight: .regular, design: .default))
                    )
                
                Spacer()
                
                
            }
            
            VStack(spacing: 0) {
                
                Spacer()
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: rightArrowVStackWidth, height: stdHeight)
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: rightArrowVStackWidth, height: stdHeight)
                
                ZStack {
                    LineView(start: .left, end: .right, hasArrow: true)
                        .frame(width: rightArrowVStackWidth, height: stdHeight)
                    Text("No")
                        .background(Color.white)
                        .multilineTextAlignment(.leading)
                    
                }
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: rightArrowVStackWidth, height: stdHeight)
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: rightArrowVStackWidth, height: stdHeight)
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: rightArrowVStackWidth, height: stdHeight)
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: rightArrowVStackWidth, height: stdHeight)
                
                
                Spacer()
                
                
            }
            
            VStack(spacing: 0) {
                
                Spacer()
                
                Capsule()
                    .fill(Color.clear)
                    .frame(width: rightShapeWidth, height: stdHeight)
                
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: rightShapeWidth, height: stdHeight)
                
                Rectangle()
                    .fill(Color.red)
                    .frame(width: rightShapeWidth, height: stdHeight)
                    .overlay(
                        Text("Accept It?")
                            .font(Font.system(size: 20, weight: .regular, design: .default))
                            .multilineTextAlignment(.center)
                    )
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: rightShapeWidth, height: stdHeight)
                
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: rightShapeWidth, height: stdHeight)
                
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: rightShapeWidth, height: stdHeight)
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: rightShapeWidth, height: stdHeight)
                
                Spacer()
                
            }
            
            //            Spacer()
            //                .frame(width: 30)
        }
        .padding( 0)
        
        
        Text("God Grant me the Serenity to accept the things I cannot change, the courage to change the things I can, and the wisdom to know the difference.")
            .frame(width: 380, height: 100)
    }
}

#Preview {
    SerenityPrayerView()
}
