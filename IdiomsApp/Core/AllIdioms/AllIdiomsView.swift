//
//  AllIdiomsVies.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import SwiftUI


struct AllIdiomsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach (IdiomsData.idioms) { idiom in
                    IdiomCell(idiom: idiom)
                        .padding(.vertical, 5)
                }
            }
        }
    }
}

#Preview {
    AllIdiomsView()
}
