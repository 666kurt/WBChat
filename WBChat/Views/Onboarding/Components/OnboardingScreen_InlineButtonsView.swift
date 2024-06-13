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
            HStack {
                Button("Политикой Конфиденциальности") {}
                Text(" и ")
                Button("Условиями Использования") {}
            }
        }
    }
}

#Preview {
    OnboardingScreen_InlineButtonsView()
}
