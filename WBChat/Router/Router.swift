//
//  Router.swift
//  WBChat
//
//  Created by Максим Шишлов on 22.06.2024.
//

import Foundation

enum Screens: Hashable {
    case contacts
    case chats
    case settings
}

class Router: ObservableObject {
    @Published var path: [Screens] = []
    @Published var selectedScreen: Screens = .contacts
    
    static let shared = Router()
    private init() {}
    
    func navigate(to screen: Screens) {
        path.append(screen)
    }
    
    func goBack() {
        _ = path.popLast()
    }
}
