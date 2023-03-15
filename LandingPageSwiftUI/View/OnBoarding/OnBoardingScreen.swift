//
//  OnBoardingScreen.swift
//  LandingPageSwiftUI
//
//  Created by MacAmd on 10/3/23.
//

import SwiftUI

struct OnBoardingScreen: View {
    
    // Properties
    @State var onBoardingItems: [OnBoardingItem] = [OnBoardingItem(message1: "First Display"),
                                                    OnBoardingItem(message2: "Second Display"),
                                                    OnBoardingItem(message3: "Third Display")]
    @State var currentIndex: Int = 0
    
    // MARK: Views
    var body: some View {
        
        //GeometryReader -> Size & Position of View parent
        GeometryReader { display in
            let size = display.size
            
            HStack(spacing: 0) {
                ForEach($onBoardingItems) { $item in
                    let isLastSlide = (currentIndex == onBoardingItems.count - 1)
                    VStack {
                        // Top Nav Bar
                        TopAppBarView(currentIndex: $currentIndex,
                                      onBoardingItems: onBoardingItems,
                                      isLastSlide: isLastSlide)
                        
                        // Movable Slides
                        VStack(spacing: 15) {
                            let offset = -CGFloat(currentIndex) * size.width
                            // Resible View Lottie
                            ResizableLottieView(onBoardingItem: $item)
                                .frame(height: size.width)
                                .onAppear {
                                    // Intially playing first slide animation
                                    if currentIndex == indexOf(item) {
                                        item.lottieView.play()
                                    }
                                }
                                .offset(x: offset)
                                .animation(.easeInOut(duration: 0.5), value: currentIndex)
                            
                            CustomTextTitleView(currentIndex: currentIndex, title: item.title, offset: offset)
                            CustomTextSubtitleView(currentIndex: currentIndex, subTitle: item.subTitle, offset: offset)
                        }
                        
                        Spacer(minLength: 0)
                        
                        // Next / Login Button / Terms
                        VStack(spacing: 15) {
                            NCButtonView(isLastSlide: isLastSlide)
                                .onTapGesture {
                                    // Updating to next index
                                    if currentIndex < onBoardingItems.count - 1 {
                                        
                                        // if the animation is finished -> currentProgress will be zero
                                        let currentProgress = onBoardingItems[currentIndex].lottieView.currentProgress
                                        onBoardingItems[currentIndex].lottieView.currentProgress = (currentProgress == 0 ? 0.7 : currentProgress)
                                        // Pause previous animation
                                        onBoardingItems[currentIndex].lottieView.pause()
                                        currentIndex += 1
                                        
                                        // Playing next animation from start
                                        onBoardingItems[currentIndex].playAnimation()
                                        
                                    }
                                }
                            
                            BottomTextView()
                        }
                    }
                    .animation(.easeInOut, value: isLastSlide)
                    .padding(20)
                    .frame(width: size.width, height: size.height)
                }
            }
            .frame(width: size.width * CGFloat(onBoardingItems.count), alignment: Alignment.leading)
        }
    }
    
    // MARK: Private function
    private func indexOf(_ item: OnBoardingItem) -> Int {
        // Retreving Index of the item in the array
        if let index = onBoardingItems.firstIndex(of: item) {
            return index
        }
        return 0
    }
    
}

struct OnBoardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14 Pro Max")
    }
}
