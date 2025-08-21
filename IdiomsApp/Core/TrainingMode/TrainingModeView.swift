//
//  TrainingModeView.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import SwiftUI

struct TrainingModeView: View {
    @State var isChooseTheMeaning: Bool = false
    
    var body: some View {
        ZStack {
            Image("bgBlueBirdBrown")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Choose the mode")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Button("Choose the idiom for the meaning") {
                    isChooseTheMeaning.toggle()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.primaryGreen.opacity(0.8))
                .cornerRadius(8)
                .foregroundColor(.white)
                
                Button("Idioms in the context") {
                    // …
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.primaryGreen.opacity(0.8))
                .cornerRadius(8)
                .foregroundColor(.white)
                
                Button("Make idioms") {
                    // …
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.primaryGreen.opacity(0.8))
                .cornerRadius(8)
                .foregroundColor(.white)
                
                Spacer()
            }
            .frame(width: 320)
            .padding(.top, 90)
            .fullScreenCover(isPresented: $isChooseTheMeaning) {
                TrainingView()
            }
        }
    }
}

#Preview {
    TrainingModeView()
}
