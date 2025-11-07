//
//  MakeIdiomsViewModel.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 06/11/2025.
//

import SwiftUI
import Combine

@MainActor
class MakeIdiomsViewModel: ObservableObject {
    @Published private(set) var questionText = ""
    @Published private(set) var options = [String]()
    @Published private(set) var wordsOptions = [String]()
    @Published private(set) var wordsChosen = [String]()
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
        
        // Подписка на обновление текущего набора слов
        service.$currentWordsOptions
            .sink { [weak self] newWords in
                self?.wordsOptions = newWords
                print("🔤 wordsOptions обновились: \(newWords)")
            }
            .store(in: &cancellables)
        
        service.$score
            .assign(to: &$score)
        
        service.$isGameOver
            .assign(to: &$isGameOver)
        
        service.startGame()
    }
    
    // MARK: - Выбор слова
    func chooseWord(_ word: String) {
        guard let index = wordsOptions.firstIndex(of: word) else { return }
        wordsOptions.remove(at: index)
        wordsChosen.append(word)
        print("✅ Добавлено слово: \(word)")
        print("🟢 chosen: \(wordsChosen)")
        print("🔴 left: \(wordsOptions)")
    }
        
    // MARK: - Удаление слова (если хочешь возвращать назад)
    func removeWord(_ word: String) {
        guard let index = wordsChosen.firstIndex(of: word) else { return }
        wordsChosen.remove(at: index)
        wordsOptions.append(word)
        print("♻️ Вернули слово: \(word)")
    }
    
    func choose(_ option: String) {
        let correct = service.checkAnswer(option)
        print("DEBUG: answer")
        print(correct)
    }


}
