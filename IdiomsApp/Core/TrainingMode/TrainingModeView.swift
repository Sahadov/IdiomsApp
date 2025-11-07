//
//  TrainingModeView.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import SwiftUI

struct TrainingModeView: View {
    enum ActiveScreen: Identifiable {
        case chooseMeaning
        case idiomsInContext
        case makeIdioms
            
        var id: Int {
            switch self {
            case .chooseMeaning: return 0
            case .idiomsInContext: return 1
            case .makeIdioms: return 2
            }
        }
    }
    
    @State private var activeScreen: ActiveScreen?
    
    var body: some View {
        ZStack {
            Image("bgBlueBirdBrown")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Choose the mode")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Button("Choose the idiom for the meaning") {
                    activeScreen = .chooseMeaning
                }
                .buttonStyle(GreenButtonStyle())
                
                Button("Idioms in the context") {
                    activeScreen = .idiomsInContext
                }
                .buttonStyle(GreenButtonStyle())
                
                Button("Make idioms") {
                    activeScreen = .makeIdioms
                }
                .buttonStyle(GreenButtonStyle())
                
                Spacer()
            }
            .frame(width: 320)
            .padding(.top, 90)
            .fullScreenCover(item: $activeScreen) { screen in
                switch screen {
                    case .chooseMeaning:
                        TrainingView()
                    case .idiomsInContext:
                        TrainingView()
                    case .makeIdioms:
                        MakeIdiomsView()
                    }
            }
        }
    }
}

#Preview {
    TrainingModeView()
}
