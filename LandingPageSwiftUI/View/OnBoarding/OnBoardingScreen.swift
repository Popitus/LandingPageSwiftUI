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
    
    // MARK: Views
    var body: some View {
            
        //GeometryReader -> Size & Position of View parent
        GeometryReader { display in
            let size = display.size
            
            HStack(spacing: 0) {
                ForEach(onBoardingItems) { item in
                    VStack {
                        // MARK: Top Nav Bar
                        HStack{
                            Button("Back"){
                                
                            }
                            Spacer(minLength: 0)
                            Button("Skip"){
                                
                            }
                        }
                        .tint(Color("Orange"))
                        .fontWeight(Font.Weight.bold)
                        
                        // MARK: Movable Slides
                        VStack(spacing: 15) {
                            // MARK: Resible View Lottie
                            
                            Text(item.title)
                                .font(Font.title.bold())
                            Text(item.subTitle)
                                .font(Font.system(size: 14))
                                .multilineTextAlignment(TextAlignment.center)
                        }
                        
                        Spacer(minLength: 0)
                        
                        // MARK: Next / Login Button / Terms
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
                            
                            HStack{
                                Text("Terms of Service")
                                
                                Text("Privacy Policy")
                            }
                            .font(.caption2)
                            .underline(true, color: .primary)
                        }
                    }
                    
                }
                .padding(20)
                .frame(width: size.width, height: size.height)
            }
            .frame(width: size.width * CGFloat(onBoardingItems.count), alignment: Alignment.leading)
        }
        
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
