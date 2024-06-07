//
//  VerificationScreen.swift
//  WBChat
//
//  Created by Максим Шишлов on 05.06.2024.
//

import SwiftUI

struct VerificationScreen: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Закроешь меня..?") {
            dismiss()
        }
    }
}

#Preview {
    VerificationScreen()
}
