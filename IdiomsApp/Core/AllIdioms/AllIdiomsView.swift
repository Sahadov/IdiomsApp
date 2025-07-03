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
            .navigationTitle("All idioms")
            .searchable(text: $searchText, prompt: "Search")
            .navigationDestination(for: Idiom.self) { idiom in
                    IdiomDetailView(idiom: idiom)
            }
        }
    }
}

#Preview {
    AllIdiomsView()
}
