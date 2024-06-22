//
//  WBChatMainView.swift
//  WBChat
//
//  Created by Максим Шишлов on 11.06.2024.
//

import SwiftUI

struct WBChatMainView: View {
    
    @State private var selectedScreen: Screens = .contacts
    @StateObject private var router: Router = .init()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                Spacer()
                switch selectedScreen {
                case .contacts:
                    ContactsScreen().environmentObject(router)
                case .chats:
                    ChatsScreen().environmentObject(router)
                case .settings:
                    SettingsScreen().environmentObject(router)
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
        .environmentObject(Router())
}
