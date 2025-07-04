//
//  IdiomExamples.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import SwiftUI

struct IdiomExamples: View {
    var idiom: Idiom
    
    var body: some View {
        VStack {
            ForEach (idiom.examples, id: \.self) { example in
                Text("“\(example)”")
                    .italic()
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.green.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundStyle(Color.accentColor)
                    .fontWeight(.regular)
                    .padding(.horizontal)
                
            }
        }
    }
}

#Preview {
    IdiomExamples(idiom: IdiomsData.idioms[0])
}
