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
        HStack(spacing: 16) {
            Image(contact.imageName)
                .overlay(alignment: .topTrailing) {
                    if contact.isOnline {
                        Circle()
                            .foregroundStyle(.green)
                            .frame(width: 12, height: 12)
                            .background(.white)
                    }
                }
            VStack(alignment: .leading) {
                Text(contact.name)
                Text(contact.lastSeen)
            }
        }
    }
}

#Preview {
    ContactsScreen_RowView(contact: Contact(name: "Анастасия Ивановна", lastSeen: "Online", isOnline: true, imageName: "person1"))
}
