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
                PersonPhotoView(contact: contact)
                PersonInfoView(contact: contact)
            }
            .padding(4)
            .padding(.bottom, 12.5)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            DividerView()
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ContactsScreen_RowView(contact: Contact(name: "Анастасия Ивановна", lastSeen: "Online", isOnline: true, hasStory: true, imageName: nil))
}
