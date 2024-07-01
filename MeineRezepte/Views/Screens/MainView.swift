//
//  MainView.swift
//  MeineRezepte
//
//  Created by Lutz Brückner on 01.07.24.
//

import SwiftUI

struct MainView: View {
    @State private var recipes = Content.defaultRecipes

    var body: some View {
        TabView {
            NavigationView {
                List {
                    ForEach($recipes) { $recipe in
                        RecipeListItemView(recipe: $recipe)
                    }
                }
                .navigationTitle("Rezepte")
            }
            .tabItem {
                Image(systemName: "list.dash")
                Text("Rezepte")
            }

            // Weitere Tabs hier hinzufügen, falls erforderlich
        }
    }
}

#Preview {
    MainView()
}
