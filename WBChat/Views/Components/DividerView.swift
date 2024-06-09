//
//  DividerView.swift
//  WBChat
//
//  Created by Максим Шишлов on 09.06.2024.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(Color("lineColor"))    }
}

#Preview {
    DividerView()
}
