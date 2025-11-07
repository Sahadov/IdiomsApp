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

    // MARK: — Публичные состояние для UI
    @Published private(set) var questionNumber = 0
    @Published private(set) var currentOptions: [String] = []
    
    @Published private(set) var currentWordsOptions: [String] = []
    @Published private(set) var currentWordsChosen: [String] = []
    @Published private(set) var score = 0
    @Published private(set) var isGameOver = false

    // MARK: — Вопросы
    private(set) var idioms = [Idiom]()
    
    
    // MARK: — Запуск новой игры
    func startGame(totalQuestions: Int = 10) {
        score = 0
        questionNumber = 0
        isGameOver = false
        
        idioms = Array(IdiomsData.idioms.shuffled().prefix(totalQuestions))
        makeAnswers()
        makeWordsOptions()
    }

    // MARK: — Выбор идиом для тренировки
    func chooseIdioms() {
        idioms = Array(IdiomsData.idioms.shuffled().prefix(10))
    }

    // MARK: — Генерация вариантов ответов
    func makeAnswers() {
        guard questionNumber < idioms.count else {
            currentOptions = []
            isGameOver = true
            return
        }
        
        var opts = Set<String>()
        opts.insert(idioms[questionNumber].text)
        while opts.count < 4 {
            opts.insert(idioms.randomElement()!.text)
        }
        
        currentOptions = Array(opts).shuffled()
    }
    
    // MARK: — Генерация вариантов слов для составления
    func makeWordsOptions() {
        guard questionNumber < idioms.count else {
            currentWordsOptions = []
            isGameOver = true
            return
        }
        currentWordsOptions = idioms[questionNumber].words.shuffled()
    }
    
    // MARK: — Проверка ответа
    func checkAnswer(_ answer: String) -> Bool {
        guard !isGameOver else { return false }

        let correct = idioms[questionNumber].text
        let isCorrect = (answer == correct)
        if isCorrect {
            score += 1
        }

        questionNumber += 1
        makeAnswers()
        makeWordsOptions()
        return isCorrect
    }
}
