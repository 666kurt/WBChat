//
//  OnboardingScreen_InlineButtonsView.swift
//  WBChat
//
//  Created by Максим Шишлов on 13.06.2024.
//

import SwiftUI

struct OnboardingScreen_InlineButtonsView: View {
    var body: some View {
        VStack {
            Text("Нажимая кнопку продолжить я соглашаюсь с")
            HStack(spacing: 0) {
                Button("Политикой Конфиденциальности") {}
                    .foregroundStyle(Color("primaryColor"))
                Text(" и ")
                Button("Условиями Использования") {}
                    .foregroundStyle(Color("primaryColor"))
            }
        }
        .font(CustomFont.metadata2())
        .foregroundStyle(Color("weakColor"))
        .padding(.bottom, 13)
    }
}

#Preview {
    OnboardingScreen_InlineButtonsView()
}
