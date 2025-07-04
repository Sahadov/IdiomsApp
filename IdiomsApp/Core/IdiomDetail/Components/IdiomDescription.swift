//
//  IdiomDescription.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import SwiftUI

struct IdiomDescription: View {
    var idiom: Idiom
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(idiom.meaning)
                .font(.title3)
                .fontWeight(.medium)
            
            Text(idiom.translations)
                .font(.headline)
                .fontWeight(.light)
        }
        .padding(.horizontal, 30)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    IdiomDescription(idiom: IdiomsData.idioms[0])
}
