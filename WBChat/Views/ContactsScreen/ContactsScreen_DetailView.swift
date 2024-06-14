//
//  ContactsScreen_DetailView.swift
//  WBChat
//
//  Created by Максим Шишлов on 07.06.2024.
//

import SwiftUI

struct ContactsScreen_DetailView: View {
    
    @Environment(\.dismiss) var dismiss;
    
    let contact: Contact
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(title: "Профиль", 
                              backButtonImage: "back_button",
                              backButtonAction: {
                                    dismiss()
                                },
                              rightButtonImage: "pencil")
            
            Spacer()
            
            Text(contact.name)
            
            Spacer()
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("backgroundColor"))
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContactsScreen_DetailView(contact: Contact(name: "Анастасия Ивановна", lastSeen: "Online", isOnline: true, hasStory: true, imageName: "person1"))
}
