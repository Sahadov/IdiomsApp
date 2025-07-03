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

enum Topic{
    case other
    case future
    case communication
    case knowledge
    case relationship
    case study
    
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
    let level: Level
    let topic: [Topic]
    var isFavourite: Bool = false
    var isDone: Bool = false
}
