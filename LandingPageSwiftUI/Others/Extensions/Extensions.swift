//
//  Extensions.swift
//  LandingPageSwiftUI
//
//  Created by MacAmd on 12/3/23.
//

import SwiftUI
import Lottie

extension OnBoardingItem {
    var playAnimation: () -> Void {
        return {
            self.lottieView.currentProgress = 0
            self.lottieView.play(toProgress: 0.7)
        }
    }
}

extension Color {
    static let orange = Color("Orange")
    static let purple = Color("Purple")
}
