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
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.lightPurple.withAlphaComponent(0.8)
        appearance.backgroundEffect = nil

        appearance.shadowImage = nil
        appearance.shadowColor = nil

        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.white
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.white
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
