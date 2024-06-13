//
//  OnboardingScreen_ButtonView.swift
//  WBChat
//
//  Created by Максим Шишлов on 05.06.2024.
//

import SwiftUI

struct OnboardingScreen_ButtonView: View {
    
    @State var showingVerificationScreen = false
    
    var body: some View {
        VStack(spacing: 18) {
            Button(action: {
                showingVerificationScreen = true
            }, label: {
                Text("Начать общаться")
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(Color("neutralColor"))
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
    OnboardingScreen_ButtonView()
}
