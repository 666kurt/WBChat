//
//  NavigationBarView.swift
//  WBChat
//
//  Created by Максим Шишлов on 09.06.2024.
//

import SwiftUI

struct NavigationBarView: View {
    
    var title: String? = nil
    var backButtonImage: String? = nil
    var backButtonAction: (() -> Void)?
    var rightButtonImage: String? = nil
    var rightButtonAction: (() -> Void)?
    var additionalRightButtonImage: String? = nil
    var additionalRightButtonAction:  (() -> Void)?
    
    
    var body: some View {
        HStack {
            
            if let backButtonImage = backButtonImage {
                Button(action: {
                    backButtonAction?()
                }, label: {
                    Image(backButtonImage)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color("activeColor"))
                })
            }
            
            if let title = title {
                Text(title)
                    .font(CustomFont.subheading1())
                    .foregroundStyle(Color("activeColor"))
            }
            
            Spacer()
            
            if let rightButtonImage = rightButtonImage {
                Button(action: {
                    rightButtonAction?()
                }, label: {
                    Image(rightButtonImage)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color("activeColor"))
                })
            }
            
            if let additionalRightButtonImage = additionalRightButtonImage {
                Button(action: {
                    additionalRightButtonAction?()
                }, label: {
                    Image(additionalRightButtonImage)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color("activeColor"))
                })
            }

        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
    }
}

#Preview {
    NavigationBarView(title: "Контакты")
}
