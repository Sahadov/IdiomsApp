//
//  IdiomsData.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import Foundation

struct IdiomsData {
    static let idioms = [
        Idiom(text: "Inside out", meaning: "Thoroughly or completely; in great detail", translations: "Вдоль и поперек / наизусть", level: .intermediate, topic: [.knowledge, .study]),
        Idiom(text: "Put the record straight", meaning: "To correct a misunderstanding or false information", translations: "Внести ясность / расставить все по местам", level: .intermediate, topic: [.communication]),
        Idiom(text: "On the cards", meaning: "Likely to happen in the near future", translations: "Очень вероятно, возможно", level: .upperIntermediate, topic: [.future])
    ]
}
