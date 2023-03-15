//
//  TopAppBarView.swift
//  LandingPageSwiftUI
//
//  Created by MacAmd on 12/3/23.
//

import SwiftUI

struct TopAppBarView: View {
    
    // Properties
    @Binding var currentIndex: Int
    var onBoardingItems:[OnBoardingItem]
    let isLastSlide: Bool
    
    // View
    var body: some View {
        
        HStack{
            Button("Back"){
                if currentIndex > 0 {
                    currentIndex -= 1
                    onBoardingItems[currentIndex].playAnimation()
                    
                }
            }
            .opacity(currentIndex > 0 ? 1 : 0)
            Spacer(minLength: 0)
            Button("Skip"){
                currentIndex = onBoardingItems.count - 1
                onBoardingItems[currentIndex].playAnimation()
            }
            .opacity(isLastSlide ? 0 : 1)

        }
        .animation(.easeInOut, value: currentIndex)
        .tint(.orange)
        .fontWeight(Font.Weight.bold)
    } 
}

struct TopAppBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopAppBarView(
            currentIndex: .constant(0),
            onBoardingItems: [OnBoardingItem(message1: "First Display"),
                                        OnBoardingItem(message2: "Second Display"),
                                        OnBoardingItem(message3: "Third Display")],
        isLastSlide: true)
    }
}

