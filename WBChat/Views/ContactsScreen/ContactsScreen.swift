//
//  ContactsScreen.swift
//  WBChat
//
//  Created by Максим Шишлов on 07.06.2024.
//

import SwiftUI

struct ContactsScreen: View {
    
    @StateObject var vm = ContactsViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ContactScreen_NavigationBarView()
                ContactScreen_SeachView()
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(vm.contacts) { contact in
                        NavigationLink(destination:ContactsScreen_DetailView(contact: contact)) {
                            ContactsScreen_RowView(contact: contact)
                        }
                    }
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    ContactsScreen()
}
