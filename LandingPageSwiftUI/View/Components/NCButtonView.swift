//
//  NextButtonView.swift
//  LandingPageSwiftUI
//
//  Created by MacAmd on 12/3/23.
//

import SwiftUI

struct NCButtonView: View {
    let isLastSlide: Bool
    var body: some View {
        Text(isLastSlide ? "Login" : "Next")
            .fontWeight(Font.Weight.bold)
            .foregroundColor(.white)
            .padding(.vertical, isLastSlide ? 13 : 12)
            .frame(maxWidth: .infinity)
            .background {
                Capsule()
                    .fill(.orange)
            }
            .padding(.horizontal,isLastSlide ? 30 : 100)
    }
}

struct NextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NCButtonView(isLastSlide: false)
    }
}
