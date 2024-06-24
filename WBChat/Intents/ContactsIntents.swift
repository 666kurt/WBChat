//
//  ContactsIntents.swift
//  WBChat
//
//  Created by Максим Шишлов on 24.06.2024.
//

import Foundation
import AppIntents

final class ContactsIntents: AppIntent {

    static var title: LocalizedStringResource = "Open Contacts"

    static var openAppWhenRun: Bool = true
    
    @MainActor
    func perform() async throws -> some IntentResult {
        Router.shared.moveToScreen(screen: .contacts)
        return .result()
    }
}
