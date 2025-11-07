//
//  Idiom.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import Foundation

enum Level {
    case beginner
    case elementary
    case preIntermediate
    case intermediate
    case upperIntermediate
    case advanced
    case proficiency
}

extension Level {
    var localizedDescription: String {
        switch self {
        case .beginner: return "Beginner"
        case .elementary: return "Elementary"
        case .preIntermediate: return "Ere-intermediate"
        case .intermediate: return "Intermediate"
        case .upperIntermediate: return "Upper-intermediate"
        case .advanced: return "Advanced"
        case .proficiency: return "Proficiency"
        }
    }
}

enum Difficulty {
    case easy
    case medium
    case hard
}

struct Idiom: Identifiable, Hashable {
    let id = UUID()
    let text: String
    let meaning: String
    let translations: String
    let examples: [String]
    let level: Level
    let topic: [Topic]
    let words: [String]
    var isFavourite: Bool = false
    var isDone: Bool = false
}
