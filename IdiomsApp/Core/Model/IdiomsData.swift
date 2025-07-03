//
//  IdiomsData.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import Foundation

struct IdiomsData {
    static let idioms = [
        Idiom(
                text: "Inside out",
                meaning: "Thoroughly or completely; in great detail",
                translations: "Вдоль и поперек / наизусть",
                examples: ["He knows the tax code inside out.", "After ten years in this job, I know the system inside out."],
                level: .intermediate,
                topic: [.knowledge, .study]),
        
        Idiom(
                text: "Put the record straight",
                meaning: "To correct a misunderstanding or false information",
                translations: "Внести ясность / расставить все по местам",
                examples: ["The politician held a press conference to put the record straight about the scandal.", "I think we had a misunderstanding, so let me put the record straight — I never said that.", "The article contained several errors, so the editor added a note to put the record straight."],
                level: .intermediate,
                topic: [.communication]),
        
        Idiom(
                text: "On the cards",
                meaning: "Likely to happen in the near future",
                translations: "Очень вероятно, возможно",
                examples: ["A promotion might be on the cards if you keep working this hard.", "Marriage isn't on the cards for us right now — we're focused on our careers.", "Rain is on the cards this weekend, so take an umbrella."],
                level: .upperIntermediate,
                topic: [.future]),
        Idiom(
                text: "Part and parcel",
                meaning: "An essential or unavoidable part of something",
                translations: "Неотъемлемая часть",
                examples: [
                    "Stress is part and parcel of the teaching profession.",
                    "Failure is part and parcel of learning — don’t give up.",
                    "Dealing with complaints is part and parcel of the job."
                ],
                level: .upperIntermediate,
                topic: [.life, .work]
            ),

            Idiom(
                text: "No strings attached",
                meaning: "Without any special conditions or restrictions",
                translations: "Без обязательств / без подвоха",
                examples: [
                    "They offered me a free trial with no strings attached.",
                    "He said he’d help me move — no strings attached.",
                    "This loan comes with no strings attached — you pay it back when you can."
                ],
                level: .intermediate,
                topic: [.communication, .offers]
            ),

            Idiom(
                text: "Go hand in hand",
                meaning: "To happen together or be closely connected",
                translations: "Идти рука об руку",
                examples: [
                    "Poverty and poor health often go hand in hand.",
                    "Creativity and hard work go hand in hand in this industry.",
                    "Success and responsibility go hand in hand."
                ],
                level: .intermediate,
                topic: [.relationships, .logic]
            ),

            Idiom(
                text: "Ring a bell",
                meaning: "To sound familiar, but not be fully remembered",
                translations: "Звучит знакомо",
                examples: [
                    "The name doesn’t ring a bell. Where have I heard it before?",
                    "Does that photo ring a bell for you?",
                    "Her voice rang a bell, but I couldn’t place her."
                ],
                level: .intermediate,
                topic: [.memory, .communication]
            ),

            Idiom(
                text: "Out of the blue",
                meaning: "Suddenly and unexpectedly",
                translations: "Как гром среди ясного неба / неожиданно",
                examples: [
                    "He showed up out of the blue after five years.",
                    "The storm came out of the blue and ruined our picnic.",
                    "She called me out of the blue to apologize."
                ],
                level: .intermediate,
                topic: [.surprise, .events]
            ),

            Idiom(
                text: "Red tape",
                meaning: "Excessive bureaucracy or formal rules that slow things down",
                translations: "Бюрократия / волокита",
                examples: [
                    "The project was delayed due to government red tape.",
                    "You’ll need to go through a lot of red tape to get a visa.",
                    "They simplified the application process to cut down on red tape."
                ],
                level: .upperIntermediate,
                topic: [.bureaucracy, .government]
            ),

            Idiom(
                text: "Beat about the bush",
                meaning: "To avoid talking about what is important",
                translations: "Ходить вокруг да около / увиливать",
                examples: [
                    "Stop beating about the bush and tell me what happened.",
                    "He tends to beat about the bush instead of being direct.",
                    "I wish she wouldn’t beat about the bush when giving feedback."
                ],
                level: .intermediate,
                topic: [.communication]
            )
    ]
}
