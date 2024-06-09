//
//  Contact.swift
//  WBChat
//
//  Created by Максим Шишлов on 07.06.2024.
//

import Foundation

struct Contact: Identifiable {
    let id = UUID().uuidString
    let name: String
    let lastSeen: String
    let isOnline: Bool
    let hasStory: Bool
    let imageName: String?
}
