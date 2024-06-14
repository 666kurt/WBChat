//
//  ContactsScreen.swift
//  WBChat
//
//  Created by Максим Шишлов on 07.06.2024.
//

import SwiftUI

struct ContactsScreen: View {
    
    @StateObject var vm = ContactsViewModel()
    @Namespace private var animationNamespace
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                NavigationBarView(title: "Контакты", rightButtonImage: "plus")
                ScrollView(.vertical, showsIndicators: false) {
                    SeachBarView(searchResult: $vm.searchResult)
                    LazyVStack(spacing: 0) {
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
