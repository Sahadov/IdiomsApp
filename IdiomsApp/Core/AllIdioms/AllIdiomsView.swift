//
//  AllIdiomsVies.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import SwiftUI


struct AllIdiomsView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach (IdiomsData.idioms) { idiom in
                    NavigationLink(value: idiom) {
                        IdiomCell(idiom: idiom)
                            .padding(.vertical, 5)
                    }
                }
            }
            .navigationTitle("Все Идиомы")
            .searchable(text: $searchText, prompt: "Search")
            .navigationDestination(for: Idiom.self) { idiom in
                    IdiomDetailView(idiom: idiom)
            }
            .padding(.bottom, 20)
            .toolbarBackground(Color.accent, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    AllIdiomsView()
}
