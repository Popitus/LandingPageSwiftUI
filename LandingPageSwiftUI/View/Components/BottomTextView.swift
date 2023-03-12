//
//  BottomTextView.swift
//  LandingPageSwiftUI
//
//  Created by MacAmd on 12/3/23.
//

import SwiftUI

struct BottomTextView: View {
    var body: some View {
        HStack{
            Text("Terms of Service")
            
            Text("Privacy Policy")
        }
        .font(.caption2)
        .underline(true, color: .primary)
        .offset(y: 5)
    }
}

struct BottomTextView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTextView()
    }
}
