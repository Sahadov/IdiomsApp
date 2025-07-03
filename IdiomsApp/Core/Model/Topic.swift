//
//  Topic.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import Foundation

enum Topic{
    case other
    case bureaucracy
    case government
    case future
    case communication
    case events
    case life
    case logic
    case knowledge
    case offers
    case relationships
    case memory
    case study
    case surprise
    case work
    
}

extension Topic {
    var localizedDescription: String {
        switch self {
        case .other: return "#другое"
        case .bureaucracy: return "#бюрократия"
        case .government: return "#государство"
        case .future: return "#будущее"
        case .communication: return "#общение"
        case .events: return "#события"
        case .life: return "#жизнь"
        case .logic: return "#логика"
        case .knowledge: return "#знания"
        case .offers: return "#предложения"
        case .relationships: return "#отношения"
        case .memory: return "#память"
        case .study: return "#учёба"
        case .surprise: return "#неожиданность"
        case .work: return "#работа"
        }
    }
}
