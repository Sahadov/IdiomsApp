//
//  MakeIdiomsView.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 06/11/2025.
//

import SwiftUI

struct MakeIdiomsView: View {
    @StateObject private var viewModel = MakeIdiomsViewModel()
    @State private var isSettingsShown: Bool = true
    @State private var selectedQuestionCount: Int = 10
    
    @Environment(\.dismiss) var dismiss
    
    // Сетка с адаптивной шириной — сама решает, сколько слов помещается в строку
    private let columns = [
        GridItem(.adaptive(minimum: 80), spacing: 12)
    ]

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
                        
                        VStack(spacing: 24) {
                                    Text("Make the idiom from the words")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    
                            LazyVGrid(columns: columns, spacing: 12) {
                                            ForEach(viewModel.wordsOptions, id: \.self) { word in
                                                Button {
                                                    print("🟢 Нажато слово: \(word)")
                                                    viewModel.chooseWord(word)
                                                } label: {
                                                    Text(word)
                                                        .font(.headline)
                                                        .foregroundColor(.white)
                                                        .padding(.vertical, 8)
                                                        .padding(.horizontal, 12)
                                                        .background(Color.green.opacity(0.8))
                                                        .cornerRadius(12)
                                                        .lineLimit(1)
                                                        .fixedSize()
                                                        .minimumScaleFactor(0.8)
                                                        .frame(height: 40)
                                                }
                                            }
                                        }
                                        .padding(.horizontal)
                            
                                    Spacer()
                            
                            LazyVGrid(columns: columns, spacing: 12) {
                                ForEach(viewModel.wordsChosen, id: \.self) { word in
                                                Button {
                                                    print("🟢 Нажато слово: \(word)")
                                                    viewModel.removeWord(word)
                                                } label: {
                                                    Text(word)
                                                        .font(.headline)
                                                        .foregroundColor(.white)
                                                        .padding(.vertical, 8)
                                                        .padding(.horizontal, 12)
                                                        .background(Color.blue.opacity(0.8))
                                                        .cornerRadius(12)
                                                        .lineLimit(1)
                                                        .fixedSize()
                                                        .minimumScaleFactor(0.8)
                                                        .frame(height: 40)
                                                }
                                            }
                                        }
                                        .padding(.horizontal)
                        }
                        .padding(.top, 40)
                        
                        ForEach(viewModel.options, id: \.self) { option in
                            Button(action: { viewModel.choose(option) }) {
                                Text(option)
                                    .padding()
                                    .font(.headline)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.primaryGreen.opacity(0.8))
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                    .foregroundStyle(.white)
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
         

            
                if isSettingsShown {
                    Color.primaryPurple
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
                        .foregroundColor(.primaryPurple)
                        .cornerRadius(10)
                    }
                    .padding()
                    .background(Color.primaryGreen)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .zIndex(2)
                    .padding(.horizontal)
                }
        }
        
    }
    
}

#Preview {
    MakeIdiomsView()
}
