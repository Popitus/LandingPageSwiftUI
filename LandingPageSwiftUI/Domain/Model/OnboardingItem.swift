//
//  OnboardingItem.swift
//  LandingPageSwiftUI
//
//  Created by MacAmd on 10/3/23.
//

import SwiftUI
import Lottie

// MARK: OnBoarding Item Model

struct OnBoardingItem: Identifiable, Equatable {
    
    // Properties
    var id: UUID = .init()
    var title: String
    var subTitle: String
    var lottieView: LottieAnimationView = .init() // -> Play & Pause Lottie Animation
    
    // Initializators
    init(title: String, subTitle: String, lottieView: LottieAnimationView) {
        self.title = title
        self.subTitle = subTitle
        self.lottieView = lottieView
    }
    
    // Custom Initializator
    init(message1: String) {
        self.init(
            title: message1,
            subTitle: "Aenean lectus metus, viverra in libero vitae, commodo laoreet est. Vestibulum finibus finibus finibus. Donec tincidunt nibh posuere lobortis placerat. Nunc tristique dapibus justo vel tincidunt. Pellentesque ac elementum nibh, at ultrices eros.",
            lottieView: .init(name: "source1", bundle: Bundle.main)
        )
    }
        
    init(message2: String) {
        self.init(
            title: message2,
            subTitle: "uspendisse ut dui tempor, tempor tellus ac, tincidunt sem. Aenean sodales placerat lobortis. Sed eu porttitor turpis, et porta turpis. Morbi euismod ipsum vel enim mollis, quis rutrum enim convallis",
            lottieView: .init(name: "source2", bundle: Bundle.main)
        )
    }
    
    init(message3: String) {
        self.init(
            title: message3,
            subTitle: "Vestibulum vulputate consectetur eros, vel blandit neque. Cras placerat urna sed cursus placerat. Maecenas id pharetra odio. Sed dapibus diam eget ligula mollis facilisis. Etiam in velit eu arcu vulputate ultrices. Donec feugiat dui sit amet diam condimentum feugiat.",
            lottieView: .init(name: "source3", bundle: Bundle.main)
        )
    }

}
