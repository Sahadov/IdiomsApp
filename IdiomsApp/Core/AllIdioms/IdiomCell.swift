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
                    .font(.title2)
                    .foregroundStyle(.primaryPurple)
                
                HStack {
                    Text(idiom.level.localizedDescription)
                        .foregroundStyle(.lightPurple)
                    
                }
                .font(.footnote)
                .fontWeight(.light)
                
            }
            
            Spacer()
            
            Image(systemName: "star")
                .foregroundStyle(.primaryGreen)
                .font(.title2)
        }
        .padding(.horizontal)
        Divider()
        
    }
}

#Preview {
    IdiomCell(idiom: IdiomsData.idioms[0])
}
