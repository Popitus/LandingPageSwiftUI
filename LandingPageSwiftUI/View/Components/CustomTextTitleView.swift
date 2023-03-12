//
//  CustomTextView.swift
//  LandingPageSwiftUI
//
//  Created by MacAmd on 12/3/23.
//

import SwiftUI

struct CustomTextTitleView: View {
    @Binding var currentIndex: Int
    let title: String
    let offset: CGFloat
    
    var body: some View {
        Text(title)
            .font(Font.title.bold())
            .offset(x: offset)
            .animation(.easeInOut(duration: 0.5).delay(0.1), value: currentIndex)
    }
}

struct CustomTextTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextTitleView(currentIndex: .constant(0), title: "Titulo", offset: 0)
    }
}
