//
//  IdiomCell.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import SwiftUI

struct IdiomCell: View {
    let idiom: Idiom
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(idiom.text)
                    .fontWeight(.bold)
                    .font(.title3)
                    .foregroundStyle(.accent)
                
                HStack {
                    Text("#знания")
                    Text("#intermediate")
                }
                .font(.footnote)
                .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Image(systemName: "star")
                .foregroundStyle(.green)
                .font(.title2)
            
            
        }
        .padding(.horizontal)
        Divider()
        
    }
}

#Preview {
    IdiomCell(idiom: IdiomsData.idioms[0])
}
