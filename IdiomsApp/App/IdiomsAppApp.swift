//
//  IdiomsAppApp.swift
//  IdiomsApp
//
//  Created by Dmitry Volkov on 03/07/2025.
//
import SwiftUI

@main
struct YourApp: App {
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()

        appearance.backgroundColor = .white
        appearance.shadowImage = nil
        appearance.shadowColor = nil

        appearance.stackedLayoutAppearance.selected.iconColor = .accent
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.accent
        ]

        appearance.stackedLayoutAppearance.normal.iconColor = .accent
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.accent
        ]

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some Scene {
        WindowGroup {
            IdiomsTabView()
        }
    }
}
