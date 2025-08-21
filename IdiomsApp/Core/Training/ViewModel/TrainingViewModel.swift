//
//  TrainingViewModel.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import SwiftUI
import Combine

@MainActor
class TrainingViewModel: ObservableObject {
    @Published private(set) var questionText = ""
    @Published private(set) var options = [String]()
    @Published private(set) var score = 0
    @Published private(set) var questionNumber = 0
    @Published private(set) var isGameOver = false

    private let service = TrainingService.shared
    private var cancellables = Set<AnyCancellable>()

    init() {
        service.$questionNumber
            .sink { [weak self] in self?.questionNumber = $0 }
            .store(in: &cancellables)
        
        service.$currentOptions
            .sink { [weak self] in
                self?.options = $0
                
                if let index = self?.service.questionNumber, index < self!.service.idioms.count {
                    self?.questionText = self!.service.idioms[index].meaning
                }
            }
            .store(in: &cancellables)
        
        service.$score
            .assign(to: &$score)
        
        service.$isGameOver
            .assign(to: &$isGameOver)
        
        service.startGame()
    }
    
    func choose(_ option: String) {
        let correct = service.checkAnswer(option)
        print("DEBUG: answer")
        print(correct)
    }


}
