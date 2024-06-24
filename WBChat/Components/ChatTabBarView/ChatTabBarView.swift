//
//  ChatTabBarView.swift
//  WBChat
//
//  Created by Максим Шишлов on 11.06.2024.
//

import SwiftUI

struct ChatTabBarView: View {
    
    @Binding var selectedScreen: Screens
    
    var body: some View {
        HStack {
            TabBarItemView(selectedScreen: $selectedScreen, screen: .contacts, icon: "group")
            Spacer()
            TabBarItemView(selectedScreen: $selectedScreen, screen: .chats, icon: "message_circle")
            Spacer()
            TabBarItemView(selectedScreen: $selectedScreen, screen: .settings, icon: "more_horizontal")
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 30)
        .padding(.top, 20)
        .background(
            Color("backgroundColor").shadow(color: .black.opacity(0.04), radius: 24, x: -1)
        )
    }
}

#Preview {
    WBChatMainView()
}
