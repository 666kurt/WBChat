//
//  WBChatMainView.swift
//  WBChat
//
//  Created by Максим Шишлов on 11.06.2024.
//

import SwiftUI

struct WBChatMainView: View {
    
    @StateObject private var router = Router.shared
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                Spacer()
                switch router.selectedScreen {
                case .contacts:
                    ContactsScreen().environmentObject(router)
                case .chats:
                    ChatsScreen().environmentObject(router)
                case .settings:
                    SettingsScreen().environmentObject(router)
                }
                Spacer()
            }
            ChatTabBarView(selectedScreen: $router.selectedScreen)
        }
        .ignoresSafeArea(.container)
        .environmentObject(router)
    }
}

#Preview {
    WBChatMainView()
        .environmentObject(Router.shared)
}
