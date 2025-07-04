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
            Text(viewModel.idioms[viewModel.questionNumber].meaning)
                .font(.title)
                .multilineTextAlignment(.center)

            ForEach(viewModel.currentOptions, id: \.self) { option in
                Text(option)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(8)
            }

            Button("Следующий вопрос") {
                viewModel.nextQuestion()
            }
            .disabled(viewModel.questionNumber + 1 >= viewModel.idioms.count)
            .padding()
        }
        .padding()
    }
}

#Preview {
    TrainingView()
}
