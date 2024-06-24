//
//  SeachBarView.swift
//  WBChat
//
//  Created by Максим Шишлов on 09.06.2024.
//

import SwiftUI

struct SeachBarView: View {
    
    @Binding var searchResult: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image("search")
                .renderingMode(.template)
                .foregroundStyle(searchResult.isEmpty ? Color("disabledColor") : Color("activeColor"))
            TextField(text: $searchResult) {
                Text("Search")
                    .font(CustomFont.bodyText1())
                    .foregroundStyle(searchResult.isEmpty ? Color("disabledColor") : Color("activeColor"))
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("offwhiteColor"))
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .padding(.top, 16)
        .padding(.bottom, 8)
        .animation(.easeInOut(duration: 0.1), value: searchResult.isEmpty)
    }
}
