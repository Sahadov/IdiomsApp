//
//  TrainingService.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import Foundation
import Combine

@MainActor
class TrainingService: ObservableObject {
    static let shared = TrainingService()

    @Published var questionNumber = 0
    @Published var currentOptions: [String] = []

    private(set) var idioms = [Idiom]()

    func chooseIdioms() {
        idioms = Array(IdiomsData.idioms.shuffled().prefix(10))
    }

    func makeAnswers() {

        var opts = Set<String>()
        opts.insert(idioms[questionNumber].text)
        while opts.count < 4 {
            opts.insert(idioms.randomElement()!.text)
        }
        currentOptions = Array(opts).shuffled()
    }
}
