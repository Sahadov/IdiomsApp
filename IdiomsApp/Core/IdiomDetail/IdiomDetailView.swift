//
//  IdiomDetailView.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import SwiftUI

struct IdiomDetailView: View {
    var idiom: Idiom
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            IdiomHeader(idiom: idiom)
            IdiomDescription(idiom: idiom)
                .padding(.top, 20)
            IdiomExamples(idiom: idiom)
                .padding(.top, 20)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    IdiomDetailView(idiom: IdiomsData.idioms[0])
}
