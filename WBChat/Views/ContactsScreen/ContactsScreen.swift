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
                NavigationBarView()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        SeachBarView(searchResult: $vm.searchResult)
                        ForEach(vm.filteredContact) { contact in
                            NavigationLink(destination: ContactsScreen_DetailView(contact: contact)
                            ) {
                                ContactsScreen_RowView(contact: contact)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 24)
            .background(Color("backgroundColor"))
        }
    }
}

#Preview {
    ContactsScreen()
}
