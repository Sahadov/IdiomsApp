//
//  IdiomsTabBar.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//

import SwiftUI

struct IdiomsTabView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            AllIdiomsView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            Text("Обучение")
                .tabItem {
                    Image(systemName: selectedTab == 1 ? "book.fill" : "book")
                        .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
            
            Text("Тренировка")
                .tabItem {
                    Image(systemName: selectedTab == 2 ? "graduationcap.fill" : "graduationcap")
                        .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                }
                .onAppear { selectedTab = 2 }
                .tag(2)
            
            Text("Мои идиомы")
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear { selectedTab = 3 }
                .tag(3)
            
            Text("Настройка")
                .tabItem {
                    Image(systemName: "gear")
                }
                .onAppear { selectedTab = 4 }
                .tag(4)
        }
        
    }
}

#Preview {
    IdiomsTabView()
}
