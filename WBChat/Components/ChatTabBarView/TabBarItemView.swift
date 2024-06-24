//
//  TabBarItemView.swift
//  WBChat
//
//  Created by Максим Шишлов on 11.06.2024.
//

import SwiftUI

struct TabBarItemView: View {
    
    @Binding var selectedScreen: Screens
    let screen: Screens
    let icon: String
    
    var body: some View {
        Button(action: {
            selectedScreen = screen
        }, label: {
            Image(icon)
                .renderingMode(.template)
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(selectedScreen == screen ? Color("primaryColor") : Color("activeColor"))
        })
    }
}

#Preview {
    WBChatMainView()
}
