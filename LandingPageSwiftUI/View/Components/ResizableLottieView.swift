//
//  ResizableLottieView.swift
//  LandingPageSwiftUI
//
//  Created by MacAmd on 11/3/23.
//

import SwiftUI

struct ResizableLottieView: UIViewRepresentable {
    
    @Binding var onBoardingItem: OnBoardingItem
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .clear
        setupLottieView(view)
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func setupLottieView(_ to: UIView) {
        let lottieView = onBoardingItem.lottieView
        lottieView.backgroundColor = .clear
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: Constrains Lottie View
        let constraints = [
            lottieView.widthAnchor.constraint(equalTo: to.widthAnchor),
            lottieView.heightAnchor.constraint(equalTo: to.heightAnchor)
        ]
        
        to.addSubview(lottieView)
        to.addConstraints(constraints)
    }
}
