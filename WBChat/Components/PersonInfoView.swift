//
//  PersonInfoView.swift
//  WBChat
//
//  Created by Максим Шишлов on 09.06.2024.
//

import SwiftUI

struct PersonInfoView: View {
    
    let contact: Contact
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(contact.name)
                .font(CustomFont.bodyText1())
                .foregroundStyle(Color("activeColor"))
            Text(contact.lastSeen)
                .font(CustomFont.metadata1())
                .foregroundStyle(Color("disabledColor"))
        }
    }
}

#Preview {
    PersonInfoView(contact: Contact(name: "Анастасия Ивановна", lastSeen: "Online", isOnline: true, hasStory: true, imageName: nil))
}
