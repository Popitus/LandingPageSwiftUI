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
                    VStack {
                        // Top Nav Bar
                        HStack{
                            Button("Back"){
                                if currentIndex > 0 {
                                    currentIndex -= 1
                                    playAnimation()
                                    
                                }
                            }
                            Spacer(minLength: 0)
                            Button("Skip"){
                                currentIndex = onBoardingItems.count - 1
                            }
                        }
                        .tint(Color("Orange"))
                        .fontWeight(Font.Weight.bold)
                        
                        // Movable Slides
                        VStack(spacing: 15) {
                            let offset = CGFloat(currentIndex) * size.width
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
                            
                            Text(item.title)
                                .font(Font.title.bold())
                                .offset(x: offset)
                                .animation(.easeInOut(duration: 0.5).delay(0.1), value: currentIndex)
                            
                            Text(item.subTitle)
                                .font(Font.system(size: 14))
                                .multilineTextAlignment(TextAlignment.center)
                                .padding(.horizontal, 15)
                                .foregroundColor(.gray)
                                .offset(x: offset)
                                .animation(.easeInOut(duration: 0.5).delay(0.2), value: currentIndex)
                        }
                        
                        Spacer(minLength: 0)
                        
                        // Next / Login Button / Terms
                        VStack(spacing: 15) {
                            Text("Next")
                                .fontWeight(Font.Weight.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .frame(maxWidth: .infinity)
                                .background {
                                    Capsule()
                                        .fill(Color("Orange"))
                                }
                                .padding(.horizontal, 100)
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
                                        playAnimation()
                                        
                                    }
                                }
                            
                            HStack{
                                Text("Terms of Service")
                                
                                Text("Privacy Policy")
                            }
                            .font(.caption2)
                            .underline(true, color: .primary)
                            .offset(y: 5)
                        }
                    }
                    
                }
                .padding(20)
                .frame(width: size.width, height: size.height)
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
    
    private func playAnimation() {
        onBoardingItems[currentIndex].lottieView.currentProgress = 0
        onBoardingItems[currentIndex].lottieView.play(toProgress: 0.7)
    }
}

struct OnBoardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14 Pro Max")
        ContentView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
