//
//  CustomTextSubtitleView.swift
//  LandingPageSwiftUI
//
//  Created by MacAmd on 12/3/23.
//

import SwiftUI

struct CustomTextSubtitleView: View {
    @Binding var currentIndex: Int
    let subTitle: String
    let offset: CGFloat
    
    var body: some View {
        Text(subTitle)
            .font(Font.system(size: 14))
            .multilineTextAlignment(TextAlignment.center)
            .padding(.horizontal, 15)
            .foregroundColor(.gray)
            .offset(x: offset)
            .animation(.easeInOut(duration: 0.5).delay(0.2), value: currentIndex)
    }
}

struct CustomTextSubtitleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextSubtitleView(currentIndex: .constant(0), subTitle: "Subtitulo", offset: 0)
    }
}
