//
//  OnboardingScreen_ButtonsView.swift
//  WBChat
//
//  Created by Максим Шишлов on 05.06.2024.
//

import SwiftUI

struct OnboardingScreen_ButtonsView: View {
    
    @State var showingVerificationScreen = false
    
    var body: some View {
        VStack(spacing: 18) {
            Button(action: {}, label: {
                Text("Пользовательское соглашение")
                    .foregroundStyle(Color("activeColor"))
                    .font(.system(size: 14, weight: .semibold))
                    .padding()
            })
            Button(action: {
                showingVerificationScreen = true
            }, label: {
                Text("Начать общаться")
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(Color("offwhiteColor"))
                    .background(Color("primaryColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            })
        }
        .padding(.horizontal, 24)
        .sheet(isPresented: $showingVerificationScreen, content: {
            VerificationScreen()
        })
    }
}

#Preview {
    OnboardingScreen_ButtonsView()
}
