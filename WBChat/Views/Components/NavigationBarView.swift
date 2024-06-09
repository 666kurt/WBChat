//
//  NavigationBarView.swift
//  WBChat
//
//  Created by Максим Шишлов on 09.06.2024.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        HStack {
            Text("Контакты")
                .font(CustomFont.subheading1())
                .foregroundStyle(Color("activeColor"))
            Spacer()
            Button(action: {}, label: {
                Image("plus")
                    .renderingMode(.template)
                    .foregroundStyle(Color("activeColor"))
            })
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
    }
}

#Preview {
    NavigationBarView()
}
