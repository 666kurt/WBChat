//
//  ContactsViewModel.swift
//  WBChat
//
//  Created by Максим Шишлов on 07.06.2024.
//

import SwiftUI

final class ContactsViewModel: ObservableObject {
    
    @Published var searchResult: String = ""
    
    // Мок данные для экрана
    @Published var contacts: [Contact] = [
        Contact(name: "Анастасия Иванова", lastSeen: "Last seen yesterday", isOnline: false, hasStory: true, imageName: "person1"),
        Contact(name: "Петя", lastSeen: "Online", isOnline: true, hasStory: true ,imageName: "person2"),
        Contact(name: "Маман", lastSeen: "Last seen 3 hours ago", isOnline: false, hasStory: true, imageName: nil),
        Contact(name: "Арбуз Дыня", lastSeen: "Online", isOnline: true, hasStory: false, imageName: "person4"),
        Contact(name: "Иван Иванов", lastSeen: "Online", isOnline: true, hasStory: true, imageName: nil),
        Contact(name: "Лиса Алиса", lastSeen: "Last seen 30 minutes ago", isOnline: true, hasStory: true, imageName: nil),
        Contact(name: "Максимка", lastSeen: "Last seen 12 minutes ago", isOnline: false, hasStory: false, imageName: "person4"),
        Contact(name: "Елизавета Мокрова", lastSeen: "Last seen 12 minutes ago", isOnline: false, hasStory: true, imageName: nil),
    ]
    
    // Отфильтрованный список контактов
    var filteredContact: [Contact] {
        if searchResult.isEmpty {
            return contacts
        } else {
            return contacts.filter { $0.name.lowercased().contains(searchResult.lowercased()) }
        }
    }
}
