//
//  TrainingView.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import SwiftUI

struct TrainingView: View {
    @StateObject private var viewModel = TrainingViewModel()

    var body: some View {
        VStack(spacing: 20) {
            if viewModel.isGameOver {
                Text("Ура! Вы правильно выбрали \(viewModel.score) идиом.")
                Button("Начать заново") {
                    TrainingService.shared.startGame()
                }
            } else {
                HStack {
                    Text("- \(viewModel.questionNumber - viewModel.score)")
                        .font(.title)
                        .foregroundStyle(.red)
                    Spacer()
                    
                    Text("+ \(viewModel.score)")
                        .font(.title)
                        .foregroundStyle(.green)
                }
                .padding(.horizontal)
                
                Text(viewModel.questionText)
                    .padding(.horizontal)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, minHeight: 250, maxHeight: 300, alignment: .center)
                    .background(
                        Image("bgBlueOne")
                            .resizable()
                            .scaledToFill()
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal)
                
                
                ForEach(viewModel.options, id: \.self) { option in
                    Button(action: { viewModel.choose(option) }) {
                        Text(option)
                            .padding()
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .background(Color.green.opacity(0.4))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
    
}

#Preview {
    TrainingView()
}
