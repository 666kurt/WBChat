//
//  ContactsScreen_DetailView.swift
//  WBChat
//
//  Created by Максим Шишлов on 07.06.2024.
//

import SwiftUI

struct ContactsScreen_DetailView: View {
    
    let contact: Contact
    
    var body: some View {
        VStack {
            Text(contact.name)
        }
    }
}

#Preview {
    ContactsScreen_DetailView(contact: Contact(name: "Анастасия Ивановна", lastSeen: "Online", isOnline: true, hasStory: true, imageName: "person1"))
}
