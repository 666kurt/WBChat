//
//  PersonPhotoView.swift
//  WBChat
//
//  Created by Максим Шишлов on 09.06.2024.
//

import SwiftUI

struct PersonPhotoView: View {
    
    let contact: Contact
    
    var body: some View {
        if let imageName = contact.imageName {
            Image(imageName)
                .resizable()
                .frame(width: 48, height: 48)
                .overlay(alignment: .topTrailing) {
                    if contact.isOnline {
                        OnlineIndicatorView()
                    }
                }
        } else {
            Text(initials(for: contact.name))
                .frame(width: 48, height: 48)
                .font(CustomFont.bodyText1()).fontWeight(.bold)
                .foregroundStyle(.white)
                .background(Color("primaryColor"))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(alignment: .topTrailing) {
                    if contact.isOnline {
                        OnlineIndicatorView()
                    }
                }
                .background() {
                    if contact.hasStory {
                        StoryIndicatorView()
                    }
                }
        }
    }
    
    private func initials(for name: String) -> String {
        let components = name.split(separator: " ")
        let initials = components.prefix(2).compactMap { $0.first }.map { String($0) }
        return initials.joined()
    }
}

#Preview {
    PersonPhotoView(contact: Contact(name: "Анастасия Ивановна", lastSeen: "Online", isOnline: true, hasStory: true, imageName: nil))
}
