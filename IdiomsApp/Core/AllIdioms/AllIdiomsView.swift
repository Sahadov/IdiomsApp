//
//  AllIdiomsVies.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import SwiftUI


struct AllIdiomsView: View {
    @State private var searchText: String = ""
    
    var categories = ["All", "Family", "Conversation", "Relationship", "Money", "Health", "Media"]
    
    var body: some View {
        NavigationStack {
            ZStack {
               
                Color.white
                    .clipShape(
                        RoundedCorner(radius: 35, corners: [.bottomLeft, .bottomRight])
                    )
                    .ignoresSafeArea(edges: .top)
                    .padding(.bottom, 15)
                
                VStack(spacing: 0) {
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(Array(categories.enumerated()), id: \.element) { index, category in
                                NavigationLink(value: category) {
                                    Text(category)
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundStyle(index == 0 ? .white : .lightPurple)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 15)
                                        .background(
                                            Group {
                                                if index == 0 {
                                                    Color.lightPurple.opacity(0.8)
                                                } else {
                                                    Color.clear
                                                }
                                            }
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.lightPurple, lineWidth: 2)
                                        )
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .shadow(color: .black.opacity(index == 0 ? 0.1 : 0), radius: 4, x: 0, y: 2)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top, 5)
                    
                    // 🔹 Основной список идиом
                    ScrollView(showsIndicators: false) {
                        ForEach(IdiomsData.idioms) { idiom in
                            NavigationLink(value: idiom) {
                                IdiomCell(idiom: idiom)
                                    .padding(.vertical, 5)
                            }
                        }
                        .padding(.top)
                        .padding(.bottom, 40)
                    }
                }
                .padding(.bottom, 30)
                .searchable(text: $searchText, prompt: "Search")
                .navigationDestination(for: Idiom.self) { idiom in
                    IdiomDetailView(idiom: idiom)
                }
            }
            .background(
                Color(.lightPurple)
                    .ignoresSafeArea()
            )
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    AllIdiomsView()
}
