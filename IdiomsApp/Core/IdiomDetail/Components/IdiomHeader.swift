//
//  IdiomHeader.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import SwiftUI

struct IdiomHeader: View {
    var idiom: Idiom
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text(idiom.level.localizedDescription)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
            Spacer()

            Text(idiom.text)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Spacer()

            HStack(alignment: .center) {
                Text(idiom.topic.map { $0.localizedDescription }.joined(separator: " "))
                    .foregroundStyle(.white)

                Spacer()

                Image(systemName: "star")
                    .foregroundStyle(.green)
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 250, maxHeight: 300, alignment: .top)
        .background(
                    Image("bgBlueOne")
                        .resizable()
                        .scaledToFill()
                )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

#Preview {
    IdiomHeader(idiom: IdiomsData.idioms[0])
}
