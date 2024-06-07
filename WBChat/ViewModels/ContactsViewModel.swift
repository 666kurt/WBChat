//
//  ContactsViewModel.swift
//  WBChat
//
//  Created by Максим Шишлов on 07.06.2024.
//

import SwiftUI

final class ContactsViewModel: ObservableObject {
    
    // Мок данные для экрана
    @Published var contacts: [Contact] = [
        Contact(name: "Анастасия Иванова", lastSeen: "Last seen yesterday", isOnline: false, imageName: "person1"),
        Contact(name: "Петя", lastSeen: "Online", isOnline: true ,imageName: "person2"),
        Contact(name: "Маман", lastSeen: "Last seen 3 hours ago", isOnline: false, imageName: "person3"),
        Contact(name: "Арбуз Дыня", lastSeen: "Online", isOnline: true, imageName: "person4"),
        Contact(name: "Иван Иванов", lastSeen: "Online", isOnline: true, imageName: "person5"),
        Contact(name: "Лиса Алиса", lastSeen: "Last seen 30 minutes ago", isOnline: false, imageName: "person6"),
    ]
}
