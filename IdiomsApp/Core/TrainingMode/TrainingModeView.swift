//
//  TrainingModeView.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import SwiftUI

struct TrainingModeView: View {
    @State var isChooseTheMeaning: Bool = false
    
    var body: some View {
        VStack {
            Text("Choose the mode")
            Button {
                isChooseTheMeaning.toggle()
            } label: {
                Text("Choose the idiom for the meaning")
            }
            Text("Idioms in the context")
            Text("Make idioms")
        }
        .fullScreenCover(isPresented: $isChooseTheMeaning) {
            TrainingView()
        }
    }
}

#Preview {
    TrainingModeView()
}
