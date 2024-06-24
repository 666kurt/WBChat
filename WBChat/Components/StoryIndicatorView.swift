//
//  StoryIndicatorView.swift
//  WBChat
//
//  Created by Максим Шишлов on 09.06.2024.
//

import SwiftUI

struct StoryIndicatorView: View {
    
    let gradientColors: [Color]
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .stroke(LinearGradient(colors: gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
            .frame(width: 54, height: 54)
    }
}

#Preview {
    StoryIndicatorView(gradientColors: [Color("#EC9EFF"), Color("#5F2EEA")])
}
