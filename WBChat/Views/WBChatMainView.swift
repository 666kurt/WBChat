//
//  WBChatMainView.swift
//  WBChat
//
//  Created by Максим Шишлов on 11.06.2024.
//

import SwiftUI

struct WBChatMainView: View {
    
    @State private var selectedScreen: Screens = .contacts
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                Spacer()
                switch selectedScreen {
                case .contacts:
                    ContactsScreen()
                case .chats:
                    ChatsScreen()
                case .settings:
                    SettingsScreen()
                }
                Spacer()
            }
            ChatTabBarView(selectedScreen: $selectedScreen)
        }
        .ignoresSafeArea(.container)
    }
}

#Preview {
    WBChatMainView()
}
