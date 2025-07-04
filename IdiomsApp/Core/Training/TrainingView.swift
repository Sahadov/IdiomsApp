//
//  TrainingView.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import SwiftUI

struct TrainingView: View {
    @StateObject private var viewModel = TrainingViewModel()
    @State private var isSettingsShown: Bool = true
    @State private var selectedQuestionCount: Int = 10
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
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
                            
                            Button {
                                dismiss()
                            } label: {
                                Text("Finish")
                                    .padding(.horizontal, 30)
                                    .padding(.vertical, 5)
                                    .background(Color.blue.opacity(0.2))
                                    .cornerRadius(10)
                            }
                            
                            Spacer()
                            
                            Text("+ \(viewModel.score)")
                                .font(.title)
                                .foregroundStyle(.green)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        
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
                                    .opacity(1)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.horizontal)
                            .padding(.vertical, 20)
                        
                        
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
                        
                        Spacer()
                    }
                }
            }
         

            
                if isSettingsShown {
                    Color.blue
                        .ignoresSafeArea()
                        .transition(.opacity)
                        .zIndex(1)
                }

               
                if isSettingsShown {
                    VStack(spacing: 20) {
                        Text("Сколько вопросов?")
                            .font(.title)
                            .foregroundStyle(.white)
                            .bold()

                        Picker("Вопросов", selection: $selectedQuestionCount) {
                            ForEach([5, 10, 15, 20], id: \.self) {
                                Text("\($0)").tag($0)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding()

                        Button("Начать") {
                            TrainingService.shared.startGame(totalQuestions: selectedQuestionCount)
                            isSettingsShown = false
                        }
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                    }
                    .padding()
                    .background(Color.green)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .zIndex(2)
                    .padding(.horizontal)
                }
        }
        
    }
    
}

#Preview {
    TrainingView()
}
