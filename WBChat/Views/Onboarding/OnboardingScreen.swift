//
//  OnboardingScreen.swift
//  WBChat
//
//  Created by Максим Шишлов on 05.06.2024.
//

import SwiftUI

struct OnboardingScreen: View {
    
    var body: some View {
        VStack(spacing: 42) {
            
            Spacer()
            
            Image("onboardingImage")
            Text("Общайтесь с друзьями и близкими легко")
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.center)
            
            Spacer()
            
            OnboardingScreen_ButtonsView()
        }
    }
}

#Preview {
    OnboardingScreen()
}
