//
//  OnlineIndicatorView.swift
//  WBChat
//
//  Created by Максим Шишлов on 08.06.2024.
//

import SwiftUI

struct OnlineIndicatorView: View {
    var body: some View {
        ZStack {
            Circle()
                .offset(x: 4, y: -4)
                .frame(width: 16, height: 16)
                .foregroundStyle(.white)
            Circle()
                .offset(x: 4, y: -4)
                .foregroundStyle(.green)
                .frame(width: 12, height: 12)
        }

    }
}

#Preview {
    OnlineIndicatorView()
}
