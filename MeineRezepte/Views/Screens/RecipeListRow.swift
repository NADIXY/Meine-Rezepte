//
//  RecipeListRow.swift
//  MeineRezepte
//
//  Created by Nadia Marina Gaspar Baptista on 02.07.24.
//

import SwiftUI

import SwiftUI

struct RecipeListRow: View {
    @Binding var recipe: Recipe
    var isFavorite: Bool

    var body: some View {
        HStack {
            Image(recipe.foodImage.rawValue)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(
                    isFavorite ? Image(systemName: "heart.fill").foregroundColor(.red) : nil
                )
            VStack(alignment: .leading) {
                Text(recipe.title)
                    .font(.headline)
                Text(recipe.description)
                    .font(.subheadline)
                Text("Erstellt am \(recipe.date.string)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}