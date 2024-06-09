//
//  StoryIndicatorView.swift
//  WBChat
//
//  Created by Максим Шишлов on 09.06.2024.
//

import SwiftUI

struct StoryIndicatorView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .stroke(LinearGradient(colors: [
                Color(hex: "#EC9EFF"), Color(hex: "#5F2EEA"),
            ], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
            .frame(width: 54, height: 54)
    }
}

#Preview {
    StoryIndicatorView()
}
