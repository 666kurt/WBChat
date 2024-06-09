//
//  ContactScreen_SeachView.swift
//  WBChat
//
//  Created by Максим Шишлов on 09.06.2024.
//

import SwiftUI

struct ContactScreen_SeachView: View {
    var body: some View {
        HStack(spacing: 8) {
            Image("search")
                .renderingMode(.template)
            Text("Search")
                .font(CustomFont.bodyText1())
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
        .foregroundStyle(Color("disabledColor"))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("offwhiteColor"))
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .padding(.top, 16)
        .padding(.bottom, 8)
    }
}

#Preview {
    ContactScreen_SeachView()
}
