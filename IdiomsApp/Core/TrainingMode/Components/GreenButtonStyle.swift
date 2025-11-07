//
//  GreenButtonStyle.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 06/11/2025.
//

import SwiftUI

struct GreenButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.primaryGreen.opacity(configuration.isPressed ? 0.6 : 0.8))
            .cornerRadius(8)
            .foregroundColor(.white)
    }
}
