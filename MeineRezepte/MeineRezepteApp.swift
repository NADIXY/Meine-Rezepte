//
//  MeineRezepteApp.swift
//  MeineRezepte
//
//  Created by Lutz und Nadia
//

import SwiftUI

@main

struct MeineRezepteApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
