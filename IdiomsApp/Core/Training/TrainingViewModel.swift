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
    @Published var idioms = [Idiom]()
    @Published var currentOptions = [String]()
    @Published var questionNumber = 0

    private let service = TrainingService.shared
    private var cancellables = Set<AnyCancellable>()

    init() {
        service.chooseIdioms()
        idioms = service.idioms

        service.$currentOptions
            .assign(to: &$currentOptions)

        service.$questionNumber
            .assign(to: &$questionNumber)
        
        service.makeAnswers()
    }

    func nextQuestion() {
        guard questionNumber + 1 < idioms.count else { return }
        service.questionNumber += 1
        service.makeAnswers()
    }
}
