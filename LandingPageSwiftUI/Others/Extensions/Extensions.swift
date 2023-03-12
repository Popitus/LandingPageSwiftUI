//
//  Extensions.swift
//  LandingPageSwiftUI
//
//  Created by MacAmd on 12/3/23.
//

import Foundation
import Lottie

extension OnBoardingItem {
    var playAnimation: () -> Void {
        return {
            self.lottieView.currentProgress = 0
            self.lottieView.play(toProgress: 0.7)
        }
    }
}
