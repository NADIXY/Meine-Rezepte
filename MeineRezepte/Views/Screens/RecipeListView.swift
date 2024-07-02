//
//  RecipeListView.swift
//  MeineRezepte
//
//  Created by Nadia Marina Gaspar Baptista on 02.07.24.
//

import SwiftUI

struct RecipeListView: View {
    @Binding var recipes: [Recipe]
    @Binding var favoritesCount: Int
    @Binding var shoppingList: [String]

    var body: some View {
        List {
            ForEach($recipes) { $recipe in
                NavigationLink(destination: RecipeDetailView(recipe: $recipe, favoritesCount: $favoritesCount, shoppingList: $shoppingList)) {
                    RecipeListRow(recipe: $recipe, isFavorite: recipe.isFavorite)
                }
                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                    Button {
                        if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
                            recipes[index].isFavorite.toggle()
                            updateFavoritesCount()
                        }
                    } label: {
                        Label("Favorisieren", systemImage: "heart")
                    }
                    .tint(.yellow)
                }
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        recipes.removeAll { $0.id == recipe.id }
                        updateFavoritesCount()
                    } label: {
                        Label("Löschen", systemImage: "trash")
                    }
                }
            }
        }
    }

    private func updateFavoritesCount() {
        let favorites = recipes.filter { $0.isFavorite }
        favoritesCount = favorites.count
    }
}
