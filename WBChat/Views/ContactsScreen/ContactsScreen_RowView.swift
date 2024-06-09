//
//  ContactsScreen_RowView.swift
//  WBChat
//
//  Created by Максим Шишлов on 07.06.2024.
//

import SwiftUI

struct ContactsScreen_RowView: View {
    
    let contact: Contact
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 12) {
                Image(contact.imageName)
                    .overlay(alignment: .topTrailing) {
                        if contact.isOnline {
                            OnlineIndicatorView()
                        }
                    }
                VStack(alignment: .leading, spacing: 6) {
                    Text(contact.name)
                        .font(CustomFont.bodyText1())
                        .foregroundStyle(Color("activeColor"))
                    Text(contact.lastSeen)
                        .font(CustomFont.metadata1())
                        .foregroundStyle(Color("disabledColor"))
                }
            }
            .padding(.bottom, 12.5)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color("lineColor"))
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ContactsScreen_RowView(contact: Contact(name: "Анастасия Ивановна", lastSeen: "Online", isOnline: true, imageName: "person1"))
}
